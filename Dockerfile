FROM directus/directus:10.12.1

# Switch to root user
USER root

# Install tzdata package
RUN apk add --no-cache tzdata

# Set the timezone
RUN cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime && echo "Europe/Zurich" > /etc/timezone

# Ensure directories exist
RUN mkdir -p /directus/extensions /directus/uploads

# Switch back to the original user
USER node

# Set permissions
RUN chmod -R 775 /directus/extensions /directus/uploads
RUN chown -R node:node /directus/extensions /directus/uploads

