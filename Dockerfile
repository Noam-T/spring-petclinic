FROM openjdk:8-jre-alpine
WORKDIR /code
COPY --from=build /app/target/*.jar /code/
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar code/*.jar"]

