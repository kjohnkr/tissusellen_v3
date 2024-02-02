FROM prestashop/prestashop:8.1.3-fpm

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG HOME_DIR=/home/www-data
# Change user ID & group ID & home directory & shell of www-data user.
# We change home dir because some custom commands may use home dir
# for caching (like composer, npm or yarn) or for another reason.
RUN mkdir ${HOME_DIR} \
    && chown -R ${USER_ID}:${GROUP_ID} ${HOME_DIR} \
    && usermod --uid ${USER_ID} --home ${HOME_DIR} --shell /bin/bash www-data \
    && groupmod --gid ${GROUP_ID} www-data
    
# # To run files with the same group as your primary user
# RUN groupmod -g 1000 www-data \
#   && usermod -u 1000 -g 1000 www-data