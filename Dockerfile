FROM nginx:alpine

# Copie des fichiers HTML
COPY html/ /usr/share/nginx/html

# Copie de la config Nginx
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Copie des certificats SSL
COPY certs/ /etc/nginx/certs

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]