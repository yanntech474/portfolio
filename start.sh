#!/bin/sh

# 📍 Emplacement des certificats SSL
CERT_PATH="/etc/letsencrypt/live/yannoportfolio.com/fullchain.pem"
KEY_PATH="/etc/letsencrypt/live/yannoportfolio.com/privkey.pem"

# 🔍 Vérification des certificats SSL
if [ ! -f "$CERT_PATH" ] || [ ! -f "$KEY_PATH" ]; then
    echo "❌ Certificats SSL manquants. Vérifiez que Certbot les a bien générés."
    exit 1
else
    echo "✅ Certificats SSL trouvés. Démarrage de Nginx..."
fi

# 🌀 Lancement de Nginx en mode non daemon
nginx -g "daemon off;"