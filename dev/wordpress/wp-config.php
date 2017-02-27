<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'troma_dev');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Mck3.BqNTZroaPpb<2yrK_;`oi~7@Hu5cv:Y-R[#/qXD^N8qe$<2g!I?EtLGqkzZ');
define('SECURE_AUTH_KEY',  'nujx9 |,t`7nHy_.B)`DoGp!Gq.z Oad=aTp;uuzQp6~4@cbNxl.NN3(5UVz1n1U');
define('LOGGED_IN_KEY',    'Wp5C&][O=Oqp/4L`0z`.zR{mhWE@77Aq+q?y(ZK Zr`x(FE7LIrf#srPl8Ku!=+]');
define('NONCE_KEY',        'F+94PkLF6}:AbhhIRlz(=HI@zf_8L3%?X<5 ueC*5nQGPzN>V=Lxf|~Pp;iGBoHc');
define('AUTH_SALT',        '+qX~O;/hvi6m%gi5.XL>n1h4kQ/:R!x>l( hNcoQwAytE,j[QKI:xyK[)+:U?b4D');
define('SECURE_AUTH_SALT', 'v2H`vAu/4 GFE4V{#Y}I5QC:f2sfAl5?5!r@1?4@|U.z+Oz|r>0o&{>{69dNtdcS');
define('LOGGED_IN_SALT',   'U/(0?Up<OmZ:]$1?j_%yQr3v^%9kxw4m2fQN`=.]k-]x$ ^6d)>mr/w*@vMPOzC4');
define('NONCE_SALT',       'ojp!kh]0i=y&tq2#d>MieQJT?2UVKxm|X/c,h+&v 6m]puHa!A{=]f,9m6^j..u7');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
