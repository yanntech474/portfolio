server {
    server_name  yanno.duckdns.org www.yanno.duckdns.org;

    root /var/www/yannoportfolio.com/portfolio;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/yanno.duckdns.org/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/yanno.duckdns.org/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}
server {
    if ($host = www.yanno.duckdns.org) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = yanno.duckdns.org) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name  yanno.duckdns.org www.yanno.duckdns.org;
    return 404; # managed by Certbot




}