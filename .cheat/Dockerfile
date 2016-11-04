# Image
FROM ubuntu:14.04
## Or
FROM node:7.0.0

# RUN executes command(s) in a new layer and creates a new image. E.g., it is often used for installing software packages.
RUN apt-get update && apt-get install -y redis-server
RUN apt-get update && \
  apt-get install -y \
    python \
    redis-server

# Create directory
RUN mkdir -p /root/app
WORKDIR /root/app

# Install app dependences
COPY file /path/to/folder
COPY folder /path/to/folder

# Add: Local-only tar extraction and remote URL support
ADD URL /path/to/folder

RUN npm install

# Expose localhost port
EXPOSE 80

# CMD sets default command and/or parameters, which can be overwritten from command line when docker container runs.
# Normally to start some services/applications on the container without affecting the images
CMD ["/bin/bash", "start_service.sh"]
