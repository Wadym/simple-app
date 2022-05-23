FROM openjdk:17
MAINTAINER Vadym Golovko <vadym.golovko@gmail.com>
COPY ./ /tmp
RUN ls -la /tmp/*
WORKDIR /tmp
RUN javac HelloWorld.java
RUN ls -la /tmp/*
# Creating a jar:
RUN jar cmvf META-INF/MANIFEST.MF HelloWorld.jar *.class
RUN ls -la /tmp/*
# Launching the application:
# java -Dhelloworld.port=8000 -jar HelloWorld.jar
EXPOSE 8080
#ENTRYPOINT ["java -Dhelloworld.port=8080 -jar ./HelloWorld.jar"]
ENV JAVA_OPTS=""
# ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /hello-docker-app.jar" ]
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Dhelloworld.port=8080 -jar ./HelloWorld.jar" ]


# docker build -f Dockerfile -t helloworld .
#  docker run -it -p 8080:8080 helloworld


# FROM openjdk:8-jdk-alpine
# VOLUME /app
# COPY ./ /app
# ADD target/hello-docker-0.0.1-SNAPSHOT.jar hello-docker-app.jar
# ENV JAVA_OPTS=""
# ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /hello-docker-app.jar" ]

# FROM openjdk:17
# COPY ./out/production/DockerHelloJava/ /tmp
# WORKDIR /tmp
# ENTRYPOINT ["java","HelloWorld"]

# docker build -t helloworld .
# docker run helloworld
# sudo docker run -d -p 80:80 mywebserver
# sudo docker run –p 8080:8080 c

# To build the image, start with the following command:

# $ docker build -f Dockerfile -t demo/oracle-java:8 .
# -f specifies the Dockerfile. This can be skipped if the filename used at the beginning of this process is Dockerfile.

# -t specifies the name of the image. The name demo/oracle-java, and the 8 after the colon, specify the image tag. The tag 8 is used because we are using Java 8. This can be changed to any tag name that makes sense.


# docker build -f Dockerfile -t helloworld .
