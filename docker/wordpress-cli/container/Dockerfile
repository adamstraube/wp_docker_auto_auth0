FROM wordpress:cli

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

RUN update-ca-certificates