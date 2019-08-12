# Use an official Python runtime as a parent image
FROM ubuntu
MAINTAINER Fomenko Alexander ffomenko25@gmail.com

# Set the working directory to /app
WORKDIR /opt

# Copy the current directory contents into the container at /app
COPY . /opt

# Install any needed packages specified in requirements.txt
RUN apt-get -y update
RUN apt-get -y install software-properties-common
RUN apt-get -y install curl nginx default-jdk git vim maven
RUN apt-get -y install openjdk-8-jdk
RUN groupadd tomcat
RUN useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
RUN mkdir /opt/tomcat
RUN curl -O http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.43/bin/apache-tomcat-8.5.43.tar.gz
RUN tar xzvf /opt/apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1
RUN chgrp -R tomcat /opt/tomcat
RUN chmod -R g+r /opt/tomcat
RUN chown -R tomcat /opt
RUN chmod -R g+x /opt
RUN mvn compile
RUN mvn package
RUN cp -r target/hello-world-war-1.0.0 /opt/tomcat/webapps

# Make port 80 available to the world outside this container
COPY default /etc/nginx/sites-available
COPY default /etc/nginx/sites-enabled
COPY nginx.conf /etc/nginx
COPY tomcat.service /etc/systemd/system
COPY tomcat-users.xml /opt/tomcat/conf
COPY server.xml /opt/tomcat/conf
COPY context.xml /opt/tomcat/webapps/manager/META-INF

EXPOSE 80
EXPOSE 9090
EXPOSE 443
# Define environment variable
ENV NAME World
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV CATALINA_OPTS -Xms512M -Xmx1024M -server -XX:+UseParallelGC
ENV JAVA_OPTS -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom
ENV CATALINA_PID /opt/tomcat/temp/tomcat.pid
ENV CATALINA_BASE /opt/tomcat

# Run app.py when the container launches
