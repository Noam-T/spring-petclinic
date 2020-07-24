FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY  . /app
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /code
COPY --from=build /app/target/*.jar /code/
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar code/*.jar"]

