FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY target/my-app-1.0-SNAPSHOT.jar /app/app.jar

EXPOSE 8080

# Membuat user non-root untuk keamanan
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

ENTRYPOINT ["java", "-jar", "app.jar"]