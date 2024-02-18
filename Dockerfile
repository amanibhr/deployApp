FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
WORKDIR /deployApp
COPY target/*.jar app.jar
EXPOSE 9090
ENTRYPOINT ["java","-jar","/app.jar"]