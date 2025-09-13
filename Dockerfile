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
