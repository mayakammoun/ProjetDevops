FROM openjdk:8-jdk-alpine
COPY target/tpAchatProject-1.0.jar tpAchatProject.jar
ENTRYPOINT ["java", "-jar", "/tpAchatProject.jar"]
