# Build stage
FROM maven:3.9.2-eclipse-temurin-17 AS builder

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Production stage
FROM nginx:alpine

# Install OpenJDK dengan versi spesifik
RUN apk add --no-cache openjdk17-jre-headless

# Buat direktori aplikasi
WORKDIR /app

# Copy jar dari builder stage
COPY --from=builder /app/target/*.jar ./app.jar

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy dan set permission start script
COPY start-services.sh /app/start-services.sh
RUN chmod +x /app/start-services.sh

EXPOSE 80

CMD ["/app/start-services.sh"]