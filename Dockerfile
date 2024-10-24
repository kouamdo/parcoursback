FROM maven:3.8.3-openjdk-17-slim AS build

COPY ./parent /app

WORKDIR /app

RUN mvn clean install -Dmaven.test.skip=true

FROM openjdk:17-jdk-slim

COPY --from=build target/*.jar parcoursback.jar

WORKDIR /app

CMD ["java", "-jar", "parcoursback.jar"]

EXPOSE 8080
