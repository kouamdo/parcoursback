# Use a secure Ubuntu base image
FROM ubuntu:20.04 AS downloader

# Set the working directory
WORKDIR /app

# Install curl and other necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size

# Download the JAR file from GitHub Packages using the secret token
ARG PARCOURS_TOKEN
ARG PARCOURS_PACKAGES_URL
ARG PARCOURS_MICROSERVICE_VERSION
ARG PARCOURS_com_group_artifact
ARG PARCOURS_BD_NAME
ARG PARCOURS_BD_URL
ARG PARCOURS_DB_PASSWORD
ARG PARCOURS_DB_USER

RUN echo "take from : ${PARCOURS_PACKAGES_URL}/${PARCOURS_com_group_artifact}/${PARCOURS_MICROSERVICE_VERSION}/document-service-${PARCOURS_MICROSERVICE_VERSION}.jar"

RUN curl -L -o document-service.jar \
      -H "Authorization: Bearer ${PARCOURS_TOKEN}" \
      "${PARCOURS_PACKAGES_URL}/${PARCOURS_com_group_artifact}/${PARCOURS_MICROSERVICE_VERSION}/document-service-${PARCOURS_MICROSERVICE_VERSION}.jar"

# Use OpenJDK as the base image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory in the final image
WORKDIR /app

# Copy the downloaded JAR from the previous stage
COPY --from=downloader /app/document-service.jar .

# Command to run the application
ENTRYPOINT ["java", "-jar", "document-service.jar", "--spring.datasource.url=${PARCOURS_BD_URL}/${PARCOURS_BD_NAME}", "--spring.datasource.username=${PARCOURS_DB_USER}", "--spring.datasource.password=${PARCOURS_DB_PASSWORD}"]

# Expose the application port
EXPOSE 8080
