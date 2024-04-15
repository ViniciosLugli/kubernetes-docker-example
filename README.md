# Kubernetes Docker Example

This repository contains the code and configuration for a simple web application deployed with Kubernetes that responds with "hello kubernetes world!" when accessed via HTTP on port 8080. The application is written in Rust using the Actix web framework and is containerized using Docker.

## Structure

-   `src/main.rs`: The Rust application source file.
-   `Cargo.toml`: The Rust package manifest file with dependencies.
-   `Dockerfile`: Instructions for building the Docker image of the application.
-   `k8/`: Directory containing Kubernetes configuration files:
    -   `deployment.yaml`: Kubernetes Deployment configuration.
    -   `service.yaml`: Kubernetes Service configuration.
    -   `ingress.yaml`: Kubernetes Ingress configuration.

## Prerequisites

To deploy and run this application, you will need:

-   Docker (for building and running containers)
-   Kubernetes cluster (e.g., minikube, kind, or a managed Kubernetes service like GKE)
-   kubectl (for interacting with your Kubernetes cluster)
-   Rust and Cargo (for building the Rust application locally, optional if you build in Docker)

## Setup and Deployment

### Step 1: Start your Kubernetes cluster

For example, if you are using minikube:

```bash
minikube start
```

### Step 2: Build and Push the Docker Image

Ensure Docker is set to use the minikube Docker daemon:

```bash
eval $(minikube docker-env)
```

Build the Docker image using the provided Dockerfile:

```bash
docker build -t kubernetes-docker-example .
```

### Step 3: Deploy the Application to Kubernetes

Apply the Kubernetes configurations:

```bash
kubectl apply -f k8/deployment.yaml
kubectl apply -f k8/service.yaml
kubectl apply -f k8/ingress.yaml
```

### Step 4: Access the Application

To find the URL to access the application, use the following command:

```bash
minikube service kubernetes-docker-example --url
```

This will output the URL at which you can access the application, which will forward requests to the Actix web server running in your Kubernetes pod.
