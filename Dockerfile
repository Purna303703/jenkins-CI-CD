FROM maven:3.8.5-openjdk-17 AS build

WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn clean package

FROM tomcat:10.0.27-jdk17-temurin

COPY --from=build /app/target/portfolio.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh","run"]
