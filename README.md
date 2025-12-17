# ci-cd-to-kubernetes
CI/CD PIPELINE TO KUBERNETES
This project follows GitOps principles.
CI builds and pushes the Docker image, while ArgoCD continuously syncs the Helm chart from Git to Kubernetes, ensuring declarative and auditable deployment

# What This Project Shows
- Dockerized application
- GitHub Actions CI
- ArgoCD
- Helm 
- Kubernetes Deployment & Service
- Horizontal Pod Autoscaling
- Production-ready structure

# CI/CD Flow
1. Code pushed to main branch
2. GitHub Actions builds Docker image
3. Image pushed to Docker Hub
4. Kubernetes manifests applied automatically

# Prerequisites
- Kubernetes cluster (Minikube / EKS / AKS / GKE)
- Docker Hub account
- kubectl configured
- GitHub secrets:
  - DOCKER_USERNAME
  - DOCKER_PASSWORD

# Deployment
# install argocd
kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# apply Argocd application
kubectl apply -f argocd/application.yaml
# access Argo cd ui
kubectl port-forward svc/argocd-server -n argocd 8080:443


# Use Case
- Startup application deployment
- CI/CD and Kubernetes demonstrations
