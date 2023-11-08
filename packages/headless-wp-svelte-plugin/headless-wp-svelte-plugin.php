<?php

/**
 * Plugin Name: Wordpress headless svelte plugin
 * Plugin URI:  https://github.com/HubbeDev/headless-wp-svelte
 * Description: A plugin to help turn WordPress into a headless CMS.
 * Version:     0.0.1
 * Author:      HubbeDev <info@responsivhub.com>
 * Author URI:  https://github.com/HubbeDev
 * License:     MIT
 *
 * @package WP_SVELTE_PLUGIN
 */

namespace WP_SVELTE_PLUGIN;

// Exit if accessed directly.
if (!defined('ABSPATH')) {
    die;
}

// Define plugin constants.
define('WP_SVELTE_PLUGIN_VERSION', '0.0.1');
define('WP_SVELTE_PLUGIN_DIR', plugin_dir_path(__FILE__));
define('WP_SVELTE_PLUGIN_URL', plugin_dir_url(__FILE__));

// Load plugin files.
foreach (glob(WP_SVELTE_PLUGIN_DIR . 'inc/*.php') as $file) {
    require_once $file;
}
