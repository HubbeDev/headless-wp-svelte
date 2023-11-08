#!/bin/bash

# https://codesandbox.io/s/thirsty-hugle-d4zjqg?file=/apps/wordpress/config/install.sh:0-369

# WordPress Install Script.
# This script automates the installation and configuration of WordPress.

# Change directories.
cd ../

# Install plugins.
composer install

# Setup WordPress.
# https://developer.wordpress.org/block-editor/reference-guides/packages/packages-env/
pnpm run wp-env start

# Configure WordPress.
pnpm run wp-env run cli /bin/bash config/wp-setup.sh
