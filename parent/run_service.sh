#!/bin/bash

# Set variables for arguments
PARCOURS_PACKAGES_URL="https://maven.pkg.github.com/kouamdo/parcoursback"
PARCOURS_MICROSERVICE_VERSION="1.0-001"
PARCOURS_com_group_artifact="cmr/notep/document-service"
PARCOURS_BD_NAME="parcoursback"
PARCOURS_BD_URL="localhost:5432"
PARCOURS_DB_USER="ledoux"
PARCOURS_DB_PASSWORD="led"
PARCOURS_SERVER_PORT=8080
PARCOUR_TOKEN_FILE=/root/pass_token


# Build the Docker image
docker build --secret id=PARCOURS_TOKEN,src=$PARCOUR_TOKEN_FILE \
  --build-arg PARCOURS_PACKAGES_URL=$PARCOURS_PACKAGES_URL \
  --build-arg PARCOURS_MICROSERVICE_VERSION=$PARCOURS_MICROSERVICE_VERSION \
  --build-arg PARCOURS_com_group_artifact=$PARCOURS_com_group_artifact \
  -t document-service .

# Run the Docker container
docker run  -p 8080:8080 \
  -e PARCOURS_BD_NAME=$PARCOURS_BD_NAME \
  -e PARCOURS_BD_URL=$PARCOURS_BD_URL \
  -e PARCOURS_DB_USER=$PARCOURS_DB_USER \
  --name document-service \
  document-service
