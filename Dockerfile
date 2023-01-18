#Download base image ubuntu 22.04
FROM ubuntu:22.04

# LABEL about the custom image
LABEL maintainer="Marco"
LABEL version="0.1"
LABEL description="This is custom Docker Image for UnifiProxy"

# Disable Prompt During Packages Installation
# ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt-get update

# Install needed Apps
RUN apt-get install -y nodejs
RUN apt-get clean

# Verzeichnis anlegen
RUN mkdir -p /unifiproxy


EXPOSE 10001/udp
VOLUME /unifiproxy


# Copy Start Script and run
RUN echo "**** copying files ****"
COPY ./server.js /unifiproxy/
COPY ./client.js /unifiproxy/
COPY ./packet-example.json /unifiproxy/

CMD ["sh","/server.js packet.json"]
