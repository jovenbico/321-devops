# ArgoCD

## Installing the Chart
```sh
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update argo
```

```sh
helm install -f values.yaml argocd argo/argo-cd \
  --version 5.23.1 \
  --namespace argocd \
  --create-namespace 
```

```sh
helm upgrade -f values.yaml argocd argo/argo-cd \
  --version 5.23.1 \
  --namespace argocd
```

```sh
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

```sh
helm uninstall argocd --namespace argocd
```

```
In order to access the server UI you have the following options:

1. kubectl port-forward service/my-release-argocd-server -n default 8080:443

    and then open the browser on http://localhost:8080 and accept the certificate

2. enable ingress in the values file `server.ingress.enabled` and either
      - Add the annotation for ssl passthrough: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-1-ssl-passthrough
      - Set the `configs.params."server.insecure"` in the values file and terminate SSL at your ingress: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-2-multiple-ingress-objects-and-hosts


After reaching the UI the first time you can login with username: admin and the random password generated during the installation. You can find the password by running:

kubectl -n default get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

(You should delete the initial secret afterwards as suggested by the Getting Started Guide: https://argo-cd.readthedocs.io/en/stable/getting_started/#4-login-using-the-cli)
```

