# syntax=docker/dockerfile:1


FROM openjdk:17.0.1-jdk-slim as java-stage


RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y python3-pip

RUN python3 -m pip install pyspark && \
    python3 -m pip install fastapi && \
    python3 -m pip install "uvicorn[standard]"

WORKDIR /app

COPY . .

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
