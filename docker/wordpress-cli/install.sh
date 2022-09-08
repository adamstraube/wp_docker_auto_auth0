echo "⚙️ Configuring Wordpress parameters...";
wp core install \
    --url="${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP}" \
    --title="${WORDPRESS_WEBSITE_TITLE}" \
    --admin_user="${WORDPRESS_ADMIN_USER}" \
    --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
    --admin_email="${WORDPRESS_ADMIN_EMAIL}"

wp option update siteurl "${WORDPRESS_WEBSITE_URL}";
wp option update users_can_register 1
wp plugin install auth0 --activate