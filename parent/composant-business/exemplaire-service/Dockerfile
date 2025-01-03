# Use a secure Ubuntu base image
FROM ubuntu:20.04 AS downloader

# Set the working directory
WORKDIR /app

# Install curl and other necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size

# Download the JAR file from GitHub Packages using the secret token
ARG PARCOURS_PACKAGES_URL
ARG PARCOURS_MICROSERVICE_VERSION
ARG PARCOURS_COM_GROUP_ARTIFACT
ARG PARCOURS_SERVER_PORT

RUN echo "take from : ${PARCOURS_PACKAGES_URL}/${PARCOURS_COM_GROUP_ARTIFACT}/${PARCOURS_MICROSERVICE_VERSION}/exemplaire-service-${PARCOURS_MICROSERVICE_VERSION}.jar"

RUN --mount=type=secret,id=PARCOURS_TOKEN curl -L -o exemplaire-service.jar \
      -H "Authorization: Bearer ${PARCOURS_TOKEN}" \
      "${PARCOURS_PACKAGES_URL}/${PARCOURS_COM_GROUP_ARTIFACT}/${PARCOURS_MICROSERVICE_VERSION}/exemplaire-service-${PARCOURS_MICROSERVICE_VERSION}.jar"

# Use OpenJDK as the base image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory in the final image
WORKDIR /app

# Copy the downloaded JAR from the previous stage
COPY --from=downloader /app/exemplaire-service.jar .

# Command to run the application
ENTRYPOINT ["java", "-jar", "exemplaire-service.jar", "--spring.datasource.url=${PARCOURS_BD_URL}/${PARCOURS_BD_NAME}", "--spring.datasource.username=${PARCOURS_DB_USER}", "--spring.datasource.password=${PARCOURS_DB_PASSWORD}","--server.port=${PARCOURS_SERVER_PORT}"]

# Expose the application port
EXPOSE ${PARCOURS_SERVER_PORT}
