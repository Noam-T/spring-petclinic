FROM openjdk:8-jre-alpine
WORKDIR /code
COPY ./target/*.jar /code/
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar code/*.jar"]

