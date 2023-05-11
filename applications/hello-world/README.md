# Minikube

## Configure minikube

Start minikube
```Shell
minikube start \
 --kubernetes-version 1.25.9 \
 --container-runtime=containerd \
 --nodes 3 \
 --cni calico \
 --addons ingress,ingress-dns
```

## Create namespace for testing
```Shell
kubectl create namespace hello
```

## Check the deployment with helm
```Shell
helm install hello ./chart/ --dry-run
```

## Check the deployment with helm
```Shell
helm install hello ./chart/ -n hello
```

## Upgrade helm deployment
```Shell
helm upgrade hello ./chart/ -n hello
```