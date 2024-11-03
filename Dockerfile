FROM openjdk:8-jdk-alpine
EXPOSE 8089
ADD target/TP-Foyer-1.0.jar TP-Foyer-1.0.jar
ENTRYPOINT ["java","-jar","/TP-Foyer-1.0.jar"]
