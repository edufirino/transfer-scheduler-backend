# C:\dev\projects\transfer-scheduler\backend\Dockerfile

# === BUILD STAGE ===
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app

# Copy only what's needed to cache Maven dependencies
COPY mvnw mvnw.cmd pom.xml ./
COPY .mvn .mvn
RUN chmod +x mvnw

# Preload dependencies to optimize rebuilds
RUN ./mvnw dependency:go-offline -B

# Copy full source after dependencies
COPY src ./src

# Build without tests
RUN ./mvnw clean package -DskipTests

# === RUNTIME STAGE ===
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy built jar from build stage
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
