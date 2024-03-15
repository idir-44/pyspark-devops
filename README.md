# Pyspark mongoDB deploy

## Install

[install docker](https://docs.docker.com/get-docker/)

---

## Local run

```bash
make reset
```

# Documentation

## Configuration de l'Environnement sur EC2

1. **Mise à jour du système et installation de Docker:**

```bash
sudo yum update -y
sudo amazon-linux-extras install docker
```

2. **Installation de Docker Compose:**

```bash
curl -SL https://github.com/docker/compose/releases/download/v2.24.7/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

3. **Démarrage du service Docker et ajout de l'utilisateur au groupe Docker:**

```bash
sudo service docker start
sudo usermod -a -G docker ec2-user
```

## Préparation du Projet PySpark

1. **Création du répertoire du projet:**

```bash
mkdir pyspark-devops
cd pyspark-devops
```

## Déploiement sur EC2 avec Docker Compose

1. **Transfert des fichiers nécessaires via SCP:**

```bash
chmod 600 pythonapp.pem
scp -i pythonapp.pem Dockerfile main.py compose.yaml .dockerignore ec2-user@34.204.44.168:/home/ec2-user/pyspark-devops
```

2. **Construction et démarrage du conteneur avec Docker Compose:**

```bash
sudo docker-compose up -d --build
```
