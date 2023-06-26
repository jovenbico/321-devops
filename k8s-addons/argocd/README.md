# ArgoCD

## Installing the Chart
```sh
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update argo
```

```sh
helm upgrade --install --values values.yaml argocd argo/argo-cd \
  --version 5.36.7 \
  --namespace argocd \
  --create-namespace
```

After reaching the UI the first time you can login with username: admin and the random password generated during the installation. You can find the password by running:
```sh
kubectl --namespace argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d
```

### [Ingress and port forwarding] see `MINIKUBE.md`
### Add to `/etc/hosts`
```
127.0.0.1 argocd.devcon
```
```
http://argocd.devcon:8000/
```

## Uninstall the chart
```sh
helm uninstall argocd --namespace argocd
```
