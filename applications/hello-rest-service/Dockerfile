# https://github.com/spring-guides/top-spring-boot-docker/tree/main#spring-boot-layer-index
# https://github.com/spring-guides/top-spring-boot-docker/tree/main#multi-stage-build
FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

RUN ./mvnw install -DskipTests
RUN mkdir target/extracted && \
  java -Djarmode=layertools -jar target/*.jar extract --destination target/extracted

FROM eclipse-temurin:17-jdk-alpine

VOLUME /tmp

ARG EXTRACTED=./target/extracted

COPY ${EXTRACTED}/dependencies/ ./
COPY ${EXTRACTED}/spring-boot-loader/ ./
COPY ${EXTRACTED}/snapshot-dependencies/ ./
COPY ${EXTRACTED}/application/ ./

ENTRYPOINT ["java","org.springframework.boot.loader.JarLauncher"]