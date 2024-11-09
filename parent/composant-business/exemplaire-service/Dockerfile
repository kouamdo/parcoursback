# Use an appropriate base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the downloaded JAR into the container
RUN --mount=type=secret,id=PARCOURS_TOKEN curl -H "Authorization: Bearer $(cat /run/secrets/PARCOURS_TOKEN)" \
     -L -o exemplaire-service.jar \
     https://maven.pkg.github.com/kouamdo/parcoursback/cmr/notep/exemplaire/exemplaire-service/1.0-SNAPSHOT/exemplaire-service-1.0-SNAPSHOT.jar

# Command to run the application
ENTRYPOINT ["java", "-jar", "exemplaire-service.jar"]

EXPOSE 9090
