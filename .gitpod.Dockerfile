FROM gitpod/workspace-base:latest

# Installing php + commons modules
RUN sudo add-apt-repository ppa:ondrej/php 
RUN sudo install-packages \
    composer \ 
    php8.0 \
    php8.0-dev \
    php8.0-bcmath \
    php8.0-ctype \
    php8.0-curl \
    php8.0-gd \
    php8.0-intl \
    php8.0-mbstring \
    php8.0-mysql \
    php8.0-pgsql \
    php8.0-sqlite3 \
    php8.0-tokenizer \
    php8.0-xml \
    php8.0-zip 

# Install symfony cli
RUN wget https://get.symfony.com/cli/installer -O - | sudo bash
RUN sudo mv /root/.symfony/bin/symfony /usr/local/bin/symfony && sudo chmod +x /usr/local/bin/symfony