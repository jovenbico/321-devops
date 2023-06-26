# Minikube

## Configure minikube

Start minikube
```sh
minikube start \
 --kubernetes-version 1.26.6 \
 --container-runtime=containerd \
 --nodes 3 \
 --cni calico
```

Enable addons
```sh
minikube addons enable ingress
minikube addons enable ingress-dns
```