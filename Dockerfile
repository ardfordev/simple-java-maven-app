# Build stage
FROM eclipse-temurin:17-jdk-alpine AS build

WORKDIR /app

# Copy the JAR file
COPY target/my-app-1.0-SNAPSHOT.jar ./app.jar

# Production stage
FROM nginx:alpine

# Install OpenJDK for running the Java application
RUN apk add --no-cache openjdk17-jre

# Copy the JAR from build stage
COPY --from=build /app/app.jar /app/app.jar

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Create script to run both Nginx and Java app
COPY start-services.sh /start-services.sh
RUN chmod +x /start-services.sh

EXPOSE 80

CMD ["/start-services.sh"]