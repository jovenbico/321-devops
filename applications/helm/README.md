# Minikube

## Configure minikube

Start minikube
```sh
minikube start \
 --kubernetes-version 1.25.10 \
 --container-runtime=containerd \
 --nodes 3 \
 --cni calico
```

Enable addons
```
minikube addons enable ingress
minikube addons enable ingress-dns
```

## Deploy local chart

### Create namespace for testing
```sh
kubectl create namespace hello
```

### Check the deployment with helm
```sh
helm install hello ./chart/ --dry-run
```

### Deployment with helm
```sh
helm install hello ./chart/ -n hello
```

### Upgrade helm deployment
```sh
helm upgrade hello ./chart/ -n hello
```

## K8s Metrics Server

### Installing the chart
```sh
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/

helm upgrade --install \
  metrics-server metrics-server/metrics-server -n kube-system

## ONLY need in minikube ##
## Kubelet certificate needs to be signed by cluster Certificate Authority (or disable certificate validation by passing `--kubelet-insecure-tls` to Metrics Server) ##
helm upgrade --install -f metrics-server/values.yaml \
  metrics-server metrics-server/metrics-server -n kube-system
```

### Verify the `metrics-server` deployment
```sh
kubectl get deployment metrics-server -n kube-system
```