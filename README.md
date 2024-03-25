## tissusellen_v3
Clone repository
TEMPORARY REMOVE WWW (restore it later with git)
sudo rm -R www
docker compose up -d


<!-- docker compose exec prestashop bash
chown -R www-data:www-data . -->
<!-- exit -->



# RESET EVERYTHING
sudo rm -R www
// CAREFUL IT WILL DELETE ALL DOCKER IMAGES ON THE SYSTEM, USE WITH CAUTION
docker system prune -a
docker volume ls
docker volume rm DB_VOLUME_NAME


# Generate SSL certificate

- Stop all containers
- Start the dummy apache server
cd letsencrypt
docker-compose up -d

- Run the initial certificate generation (adjust paths)

sudo docker run -it --rm \
-v /home/debian/tissusellen_v3/certbot/conf:/etc/letsencrypt \
-v /home/debian/tissusellen_v3/certbot/lib:/var/lib/letsencrypt \
-v $PWD/html:/data/letsencrypt \
-v /home/debian/tissusellen_v3/certbot/log:/var/log/letsencrypt \
certbot/certbot \
certonly --webroot \
--email glambert@tissusellen.com  --agree-tos --no-eff-email \
--webroot-path=/data/letsencrypt \
-d tissusellen.com -d www.tissusellen.com

- Change the httpd.conf 
    - to load the appropriate modules
        LoadModule ssl_module modules/mod_ssl.so
        LoadModule socache_shmcb_module modules/mod_socache_shmcb.so
    - to listen to port 443
        Listen 443
    - to include the generated certificates in the *:443 vhost
        SSLEngine on
        SSLCertificateFile /etc/letsencrypt/live/tissusellen.com/fullchain.pem
        SSLCertificateKeyFile /etc/letsencrypt/live/tissusellen.com/privkey.pem
    - redirect non https to https in *:80 vhost
        RewriteEngine On
        RewriteCond %{HTTPS} off
        RewriteRule ^(.*)$ https://%{HTTP_HOST}$1 [R=301,L]
    - add alias to acme challenge to allow cert renews
        Alias /.well-known/acme-challenge/ /var/www/certbot/.well-known/acme-challenge/
        <Directory "/var/www/certbot/.well-known/acme-challenge/">
            Options None
            AllowOverride None
            ForceType text/plain
            RedirectMatch 404 "^(?!/\.well-known/acme-challenge/[\w-]{43}$)"
        </Directory>