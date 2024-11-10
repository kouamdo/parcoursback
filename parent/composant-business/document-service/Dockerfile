# Use an appropriate base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

RUN apt-get install -y curl

# Copy the downloaded JAR into the container
RUN --mount=type=secret,id=PARCOURS_TOKEN curl -H "Authorization: Bearer PARCOURS_TOKEN" \
     -L -o document-service.jar \
     https://maven.pkg.github.com/kouamdo/parcoursback/cmr/notep/document-service/1.0-SNAPSHOT/document-service-1.0-SNAPSHOT.jar

# Command to run the application
ENTRYPOINT ["java", "-jar", "document-service.jar"]

EXPOSE 8080
