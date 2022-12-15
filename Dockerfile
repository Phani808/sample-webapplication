FROM openjdk:8
EXPOSE 8080
ADD target/WebApp.jar WebApp.jar
ENTRYPOINT ["java","-jar","/WebApp.jar"]