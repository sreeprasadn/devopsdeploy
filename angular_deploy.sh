#!/bin/bash
set -e
set -a


cd /tmp/$1/nodejs/kube/
. ./properties.yaml
set +a

#copy express server
echo "copy express server to /tmp"
cp -rf /scripts/express-server /tmp/$1/nodejs/kube/

#Create Docker Image
echo "creating docker image ${USER_ID}_nodejs:v1"
docker build -t ${USER_ID}_nodejs:v1 .

echo "--- Deploying"

#ENV=$1
echo "[ENVIRONMENT]: $ENV"
echo "[NAMESPACE]: $K8S_NAMESPACE"

echo "Connecting Kubernetes Cluster"
#Copy kubernetes cluster configuration file to build server

#echo "Create Namespace for the user"
#kubectl create namespace $K8S_NAMESPACE

echo "Substituting the environment variable in k8 manifest file"
envsubst < ${K8S_DEPLOYMENT_FILE} > /tmp/$K8S_DEPLOYMENT_FILE.generated

kubectl apply -f  /tmp/$K8S_DEPLOYMENT_FILE.generated -n $K8S_NAMESPACE --validate=false --kubeconfig /scripts/config

echo "Wait for deployment to finish..."
kubectl rollout status deployment/$K8S_DEPLOYMENT_NAME -n $K8S_NAMESPACE --kubeconfig /scripts/config
