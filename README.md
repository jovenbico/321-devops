# 321 DevOps - Terraform Code

## ACloud Guru
### Create AWS sandbox in ACloud Guru
Create the sandbox and take copy the AWS `access` and `secret` keys  
[ACloud Guru - sandbox](https://learn.acloud.guru/cloud-playground/cloud-sandboxes)

## Terraform Cloud
### Update Variables in Terraform Cloud
[self-service workspace](https://app.terraform.io/app/321-devops/workspaces/321-devops)
```
AWS_ACCESS_KEY_ID=*
AWS_SECRET_ACCESS_KEY=*
```
### Start new run in Terraform Cloud
Start new run in self-service workspace to update the [workspace.tf](/terraform/main/main.tf).

---
### Terraform login in local
```
terraform login
```

```
---------------------------------------------------------------------------------

Open the following URL to access the tokens page for app.terraform.io:
    https://app.terraform.io/app/settings/tokens?source=terraform-login


---------------------------------------------------------------------------------
```

```
terraform init
```
```
terraform plan
```
---
### Update kubeconfig in local
```
aws configure
# AWS Access Key ID [None]: ***
# AWS Secret Access Key [None]: ***
# Default region name [None]: us-east-1
```

```
./_auth.sh 321-devops-eks-cluster 321-devops-eks-cluster
```