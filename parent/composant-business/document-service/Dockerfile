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
ARG ARTIFACT_URL

RUN curl -o document-service.jar \
    "https://github-registry-files.githubusercontent.com/\
    869694605/de6a1e00-c875-11ef-867b-ab6f145c169b?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20250101%2Fus-east-\
    1%2Fs3%2Faws4_request&X-Amz-Date=20250101T170641Z&X-Amz-Expires=300&X-Amz-Signature=\
    8916b840f58ebe58e5104560f395a109d3e32479f88df97ccec7b71d1b812772&X-Amz-SignedHeaders=host&response-\
    content-disposition=filename%3D\
    document-service-1.0-000.jar&response-content-type=application%2Foctet-stream"

# Use OpenJDK as the base image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory in the final image
WORKDIR /app

# Copy the downloaded JAR from the previous stage
COPY --from=downloader /app/document-service.jar .

# Command to run the application
ENTRYPOINT ["java", "-jar", "document-service.jar"]

# Expose the application port
EXPOSE 8080
