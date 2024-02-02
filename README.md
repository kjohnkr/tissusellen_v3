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
