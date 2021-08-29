FROM gitpod/workspace-base:latest

# Installing php + commons modules
RUN sudo add-apt-repository ppa:ondrej/php 
RUN sudo install-packages \
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

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \ 
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \ 
    && php -r "unlink('composer-setup.php');" \ 
    && sudo mv composer.phar /usr/local/bin/composer

# Install symfony cli
RUN wget https://get.symfony.com/cli/installer -O - | sudo bash
RUN sudo mv /root/.symfony/bin/symfony /usr/local/bin/symfony && sudo chmod +x /usr/local/bin/symfony