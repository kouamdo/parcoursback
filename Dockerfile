FROM maven:3.8.3-openjdk-17-slim AS build

COPY ./parent /app

WORKDIR /app

RUN mvn clean install -Dmaven.test.skip=true && ls -l /app/target

FROM openjdk:17-jdk-slim

COPY --from=build /app/parent/target/*.jar /app/parent/parcoursback.jar

WORKDIR /app

CMD ["java", "-jar", "/app/parent/parcoursback.jar"]

EXPOSE 8080
