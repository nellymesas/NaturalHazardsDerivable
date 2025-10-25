#Lugi docker orquestrator container
#ARG CODE_VERSION=20.04 
#FROM ubuntu:${CODE_VERSION} 
#FROM python:3.9.1
FROM osgeo/gdal:ubuntu-full-3.2.2

MAINTAINER Carles Carrillo <carles.carrillo@uab.cat>

#ENV DEBIAN_FRONTEND=noniterective

# Install required packages
RUN apt-get update -q && apt-get upgrade -yq
RUN apt-get install -y build-essential libaec-dev zlib1g-dev libcurl4-openssl-dev libboost-dev zip unzip gfortran gcc g++ python3-pip


# We will create a directory where we will install our application.
RUN mkdir -p /opt/app 
# We will indicate that the working directory will be that of the application. 
WORKDIR /opt/app  

#RUN mkdir -p /opt/app/luigi_orchestrator/
RUN mkdir -p /opt/app/utilities/


# We will install our application in the directory. 
COPY showtime.sh /opt/app

# We will grant execution permissions to the script. 
RUN chmod 777 /opt/app/showtime.sh 


# We will tell you which process to start.
ENTRYPOINT [ "/opt/app/showtime.sh", "5" ]
