# Dockerfile
FROM nginx:alpine

LABEL maintainer="Yanick Ekongué"
WORKDIR /usr/share/nginx/html

# Copie des fichiers du portfolio
COPY . /usr/share/nginx/html

# Copie de la configuration Nginx
COPY yannoportfolio.com /etc/nginx/conf.d/default.conf

# Déclaration du volume pour les certificats SSL
VOLUME ["/etc/letsencrypt"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]