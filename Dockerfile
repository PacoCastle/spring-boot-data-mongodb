FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /app
COPY mvnw mvnw
COPY mvnw.cmd mvnw.cmd
COPY . .
RUN sed -i 's/\r$//' mvnw && chmod +x mvnw
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
