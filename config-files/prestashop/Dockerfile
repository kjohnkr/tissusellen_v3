FROM prestashop/prestashop:8.1.3-fpm

# To run files with the same group as your primary user
RUN groupmod -g 1000 www-data \
  && usermod -u 1000 -g 1000 www-data