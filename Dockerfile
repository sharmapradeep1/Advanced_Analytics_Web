#Build a docker image on top of python 3.9alpine image
FROM python:3.10.0a2-slim-buster

#Who maintains this image
MAINTAINER Pradeep

#Unbuffered recommended for docker, outputs directly, does not buffer
ENV PYTHONUNBUFFERED 1

#requirements.txt is for installing dependencies
#copy file into image
COPY ./requirements.txt /requirements.txt
#run file
RUN pip install -r /requirements.txt

#create empth folder on image
RUN mkdir /aaw
#New dir as default dir for application
WORKDIR /aaw

#Copies code
COPY ./aaw /aaw


#create user that will run application using docker.
#-D means no home directory etc, will be used to run application only
RUN adduser --disabled-password --gecos '' aawuser
USER aawuser
