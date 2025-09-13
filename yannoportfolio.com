server {
    listen 80;
    server_name yanno.duckdns.org www.yanno.duckdns.org;

    # Redirection HTTP vers HTTPS
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name yanno.duckdns.org www.yanno.duckdns.org;

    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    # Certificats SSL montés via volume
    ssl_certificate /etc/letsencrypt/live/yanno.duckdns.org/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yanno.duckdns.org/privkey.pem;

    # Fichiers supplémentaires générés par Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
}