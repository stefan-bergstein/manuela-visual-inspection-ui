# ------ BUILDER ------
FROM ubuntu:22.10 as builder

# API URL which will be handed down to the flutter web
# app at build time - if we need to provide it at a later
# stage (for example container has already been build), we
# can provide a ConfigMap / PersistantVolume with a file
# called config at assets/env/ contianing those args
ARG API_URL

# System setup
RUN apt-get update && \ 
    apt-get install -y unzip xz-utils git openssh-client curl && \
    apt-get upgrade -y && \
    rm -rf /var/cache/apt

# Set the working directory
WORKDIR /src

# Copy all files over to the workdir of the build process
COPY . .

# Pinned flutter setup
RUN ./flutterw config --no-analytics

# Get all flutter dependencies
RUN ./flutterw pub get

# Build static web files (always canvaskit renderer)
RUN ./flutterw build web --web-renderer canvaskit 

# ------ RUNNER ------
FROM registry.access.redhat.com/ubi8/nginx-120

# Copy static files to folder where nginx will serve them
COPY --from=builder /src/build/web .

# Change group and access rights so these folders / executables can
# be used as non root for security reasons
# RUN chgrp -R 0 /var/cache/nginx && \
#     chmod -R g=u /var/cache/nginx

# RUN chgrp -R 0 /etc/nginx/conf.d && \
#     chmod -R g=u /etc/nginx/conf.d

# Change user to non root
USER 1000

CMD nginx -g "daemon off;"