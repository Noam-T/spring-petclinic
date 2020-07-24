#FROM newtmitch/sonar-scanner as sonarqube
#WORKDIR /app
#COPY  . /app
#RUN sonar-scanner -Dsonar.projectBaseDir=/app -Dsonar.host.url="http://130.61.159.221:9000" -Dsonar.exclusions=**.java

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY  . /app
RUN mvn install

FROM newtmitch/sonar-scanner as sonarqube
WORKDIR /code
COPY --from=build /app/target/* /code/
RUN sonar-scanner -Dsonar.projectBaseDir=/code -Dsonar.host.url="http://130.61.159.221:9000"

FROM openjdk:8-jre-alpine
WORKDIR /code
COPY --from=build /app/target/*.jar /code/
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar code/*.jar"]

