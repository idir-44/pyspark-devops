# syntax=docker/dockerfile:1



FROM openjdk:17.0.1-jdk-slim as java-stage


RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y python3-pip

RUN python3 -m pip install pyspark

WORKDIR /app

COPY . .

CMD python3 main.py
