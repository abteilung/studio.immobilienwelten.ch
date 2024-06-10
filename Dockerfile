FROM directus/directus:10.12.1

# Switch to root user
USER root

# Install tzdata package
RUN apk add --no-cache tzdata

# Set the timezone
RUN cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime && echo "Europe/Zurich" > /etc/timezone

# Switch back to the original user
USER node


# Switch to root user to copy init script and set permissions
USER root

# Copy the initialization script
COPY init-db.sh /docker-entrypoint-initdb.d/

# Change permissions for the script
RUN chmod 755 /docker-entrypoint-initdb.d/init-db.sh

# Expose the PostgreSQL port (if necessary, depending on your setup)
EXPOSE 5432

# Switch back to the original user
USER node
