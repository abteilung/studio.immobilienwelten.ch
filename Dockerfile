FROM directus/directus:10.12

# Switch to root user
USER root

# Install tzdata package
RUN apk add --no-cache tzdata

# Set the timezone
RUN cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime && echo "Europe/Zurich" > /etc/timezone

# Ensure directories exist and have correct permissions
# RUN mkdir -p /directus /directus/database /directus/extensions /directus/uploads && \
#     chmod -R 775 /directus /directus/database /directus/extensions /directus/uploads && \
#     chown -R node:node /directus /directus/database /directus/extensions /directus/uploads

    
# Switch back to the original user
USER node

# Remove File from the image
RUN rm -rf /entrypoint.sh