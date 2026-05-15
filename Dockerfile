FROM maven:3.9.6-eclipse-temurin-17 as builder
LABEL authors="eduarda"

WORKDIR /build

COPY . .

RUN mvn clean package -DskipTests -Dcheckstyle.skip=true

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=builder /build/target/*.jar /app/app.jar

CMD ["java", "-jar", "app.jar"]