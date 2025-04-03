echo "⚙️ Configuring Wordpress parameters...";
wp core install \
    --url="${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP}" \
    --title="${WORDPRESS_WEBSITE_TITLE}" \
    --admin_user="${WORDPRESS_ADMIN_USER}" \
    --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
    --admin_email="${WORDPRESS_ADMIN_EMAIL}"

wp option update siteurl "${WORDPRESS_WEBSITE_URL}";
wp option update users_can_register 1

# Source https://github.com/auth0/wordpress/issues/893#issuecomment-2100611538
cd wp-content/plugins || exit
composer require symfony/http-client nyholm/psr7 auth0/wordpress:^5.0 -n
mkdir ./auth0
cp -r ./vendor/auth0/wordpress/* ./auth0/
mv ./vendor/ ./auth0/vendor/

# wp plugin install auth0 --activate