FROM nginx:alpine
LABEL maintainer="ekongué yanick"
WORKDIR /usr/share/nginx/portfolio

# Copy the nginx configuration file
COPY yannoportfolio.com /etc/nginx/yannoportfolio.com
# Copy the static files to the nginx html directory
# clone the repository
RUN apk add --no-cache git && \
    git clone https://github.com/yanntech474/portfolio.git
# Copy the cloned repository files to the nginx html directory
RUN mkdir -p /usr/share/nginx/portfolio && \
    cp -r portfolio/* /usr/share/nginx/portfolio/
COPY . /usr/share/nginx/portfolio
# Expose port 80
EXPOSE 80   
# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
# Set the working directory