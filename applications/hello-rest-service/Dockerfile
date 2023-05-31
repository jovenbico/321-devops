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

##### Spring boot layer index #####
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /workspace/app

VOLUME /tmp

ARG EXTRACTED=/workspace/app/target/extracted

COPY --from=build ${EXTRACTED}/dependencies/ ./
COPY --from=build ${EXTRACTED}/spring-boot-loader/ ./
COPY --from=build ${EXTRACTED}/snapshot-dependencies/ ./
COPY --from=build ${EXTRACTED}/application/ ./

ENTRYPOINT ["java","org.springframework.boot.loader.JarLauncher"]