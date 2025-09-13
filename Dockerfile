# Phase 1 : Installation de Certbot
FROM ubuntu:22.04 AS certbot_installer

# Mise à jour des paquets et installation de Certbot
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:certbot/certbot && \
    apt-get update && \
    apt-get install -y certbot certbot-nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# Phase 2 : Configuration de l'application
FROM nginx:alpine AS app_configurator

LABEL maintainer="Yanick Ekongué"
WORKDIR /usr/share/nginx/html

# Copie des fichiers du portfolio
COPY . /usr/share/nginx/html

# Copie du fichier de configuration Nginx
COPY yannoportfolio.com /etc/nginx/conf.d/default.conf

# Copie du script de démarrage
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Déclaration du volume pour les certificats SSL
VOLUME ["/etc/letsencrypt"]

ENTRYPOINT ["/start.sh"]
# Phase 3 : Serveur Nginx final
FROM nginx:alpine
LABEL maintainer="ekongué yanick"
WORKDIR /usr/share/nginx/portfolio

# Installation des dépendances
RUN apk update && apk add bash \
apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir certbot-nginx

# Création du répertoire pour Let's Encrypt
RUN mkdir -p /etc/letsencrypt
# Copy the nginx configuration file
COPY yannoportfolio.com /etc/nginx/yannoportfolio.com
# Copy the local portfolio files to the nginx html directory
COPY . /usr/share/nginx/portfolio
# Expose les ports 80 et 443
EXPOSE 80  443
# Command to obtain SSL certificates (uncomment and modify the email and domain as needed)
# RUN certbot --nginx -m
# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]