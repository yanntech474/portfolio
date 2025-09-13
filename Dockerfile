FROM nginx:alpine
LABEL maintainer="ekongué yanick"
WORKDIR /usr/share/nginx/portfolio

# Copy the nginx configuration file
COPY yannoportfolio.com /etc/nginx/yannoportfolio.com
# Copy the static files to the nginx html directory
# Copy the local portfolio files to the nginx html directory
COPY . /usr/share/nginx/portfolio
# Expose port 80
EXPOSE 80   
# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
# Expose port 80
