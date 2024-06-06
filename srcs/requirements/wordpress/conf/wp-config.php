<?php
/** The base configuration for WordPress
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 */

/** The name of the database for WordPress */
define('DB_NAME', 'TEMP_DB_NAME');

/** MySQL database username */
define('DB_USER', 'TEMP_DB_USER');

/** MySQL database password */
define('DB_PASSWORD', 'TEMP_DB_USER_PASSWORD');

/** MySQL hostname */
define('DB_HOST', 'TEMP_DB_HOST');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/** WordPress Database Table prefix. */
$table_prefix = 'wp_';

/** For developers: WordPress debugging mode. */
define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>
