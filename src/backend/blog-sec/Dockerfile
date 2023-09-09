FROM openjdk:latest
ENTRYPOINT ["id"]
#MAINTAINER blog-sec.msi.com
#RUN addgroup -S blog && adduser -S blog -G blog
#USER blog
COPY ./target/blog-sec-0.0.1-SNAPSHOT.jar blog-sec-0.0.1.jar
ENTRYPOINT ["java","-jar","/blog-sec-0.0.1.jar"]