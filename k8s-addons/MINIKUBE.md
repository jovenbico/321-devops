# Minikube

## Configure minikube

### Start minikube
```sh
minikube start \
 --kubernetes-version 1.26.6 \
 --container-runtime=containerd \
 --nodes 3 \
 --cni calico
```

### Enable addons
```sh
minikube addons enable ingress
minikube addons enable ingress-dns
```

### [Ingress and port forwarding](https://github.com/devcontainers/features/tree/main/src/kubectl-helm-minikube#ingress-and-port-forwarding)
```sh
# Run this to forward to localhost in the background
nohup kubectl port-forward --pod-running-timeout=24h -n ingress-nginx service/ingress-nginx-controller 8000:80 &
```