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

# Copie de la configuration et des fichiers nécessaires
COPY --from=app_configurator /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY --from=app_configurator /usr/share/nginx/html /usr/share/nginx/html
COPY --from=app_configurator /start.sh /start.sh
# Déclaration du volume pour les certificats SSL
VOLUME ["/etc/letsencrypt"]

RUN chmod +x /start.sh

EXPOSE 80 443

ENTRYPOINT ["/start.sh"]
CMD ["nginx", "-g", "daemon off;"]