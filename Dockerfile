# Use Maven image for building
FROM maven:3.8.3-openjdk-17-slim AS build

# Copy the entire parent directory to /app
COPY ./parent /app

# Set the working directory
WORKDIR /app

# Run Maven to build the project without tests
RUN mvn clean install -Dmaven.test.skip=true

# Use a lightweight OpenJDK image for running the application
FROM openjdk:17-jdk-slim

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/parcoursback-*.jar /app/parcoursback.jar

# Set the working directory for running the application
WORKDIR /app

# Command to run the application
CMD ["java", "-jar", "parcoursback.jar"]

# Expose port 8080
EXPOSE 8080
