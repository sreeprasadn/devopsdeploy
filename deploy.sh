#!/bin/bash
set -e
set -a

cd /var/www/svc/devops/branches/sedora/Java/kube/

. ./properties.yaml
set +a

#Create Docker Image
echo "creating docker image ${USER_ID}_jre:v1"
docker build -t ${USER_ID}_jre:v1 .

echo "--- Deploying"

#ENV=$1
echo "[ENVIRONMENT]: $ENV"
echo "[NAMESPACE]: $K8S_NAMESPACE"

echo "Connecting Kubernetes Cluster"
#Copy kubernetes cluster configuration file to build server

echo "Create Namespace for the user"
kubectl create namespace $K8S_NAMESPACE

echo "Substituting the environment variable in k8 manifest file"
envsubst < ${K8S_DEPLOYMENT_FILE} > $K8S_DEPLOYMENT_FILE.generated

kubectl apply -f  $K8S_DEPLOYMENT_FILE.generated -n $K8S_NAMESPACE --validate=false

echo "Wait for deployment to finish..."
kubectl rollout status deployment/$K8S_DEPLOYMENT_NAME -n $K8S_NAMESPACE
