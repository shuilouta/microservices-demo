# First stage: complete build environment
FROM maven:3.5.0-jdk-8-alpine AS builder

# add pom.xml and source code
ADD ./pom.xml pom.xml
ADD ./src src/

# package jar
RUN mvn clean package


# Second stage: minimal runtime environment
FROM openjdk:8-jre
COPY --from=builder target/microservices-demo-2.1.0.RELEASE.jar app.jar
EXPOSE 1111
EXPOSE 2222
EXPOSE 3333
# Optional default command
# ENTRYPOINT ["java","-jar","/app.jar","reg"]
