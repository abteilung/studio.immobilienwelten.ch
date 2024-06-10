#!/bin/sh

# Set permissions for extensions and uploads directories
chown -R node:node /directus/extensions /directus/uploads

# Start the Directus service
exec "$@"
