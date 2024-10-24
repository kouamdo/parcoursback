FROM maven:3.8.3-openjdk-17-slim AS build

COPY ./parent /app

WORKDIR /app

RUN mvn clean install

FROM openjdk:17-jdk-slim

COPY --from=build /app/target/*.jar /app/api_greenlive.jar

WORKDIR /app

CMD ["java", "-jar", "api_greenlive.jar"]
