# Google Terraform Code

## [Running Terraform on your workstation.](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#running-terraform-on-your-workstation)
You can enable ADCs by running the command
```sh
gcloud auth application-default login
```

## Run Terraform code
```sh
terraform init
terraform plan -var-file=google.tfvars
```
```sh
terraform apply -auto-approve -var-file=google.tfvars
```