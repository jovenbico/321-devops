# EKS Cluster with Workloads

Terraform code that will deploy the following [workloads:](workloads.tf)

* ingress-nginx
* metrics-server
* hello-app (python)

## Prerequisites

Ensure that you have the following tools installed locally:

1. [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
2. [kubectl](https://Kubernetes.io/docs/tasks/tools/)
3. [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Deploy

Using input variable values`testing.tfvars`
```
AWS_ACCESS_KEY_ID = ""
AWS_SECRET_ACCESS_KEY = ""
GITHUB_TOKEN = ""
```

To provision this example:  
Run the terraform plan, which lets you preview the changes
```sh
terraform init
terraform plan -var-file="testing.tfvars"
```

Lets execute the terraform code
```sh
terraform apply -target module.vpc -var-file="testing.tfvars"
terraform apply -target module.eks -var-file="testing.tfvars"
terraform apply -var-file="testing.tfvars"
```

## Validate

The following command will update the `kubeconfig` on your local machine and allow you to interact with your EKS Cluster using `kubectl` to validate the deployment.

1. Run `update-kubeconfig` command:

    ```sh
    aws eks --region <REGION> update-kubeconfig --name <CLUSTER_NAME>
    ```

2. List out the pods running currently:
    ```sh
    kubectl get pods -A
    ```

3. View the current nodes:
    ```sh
    kubectl get nodes
    ```

4. View the current ingresses:
    ```sh
    kubectl get ingress -A
    ```

## Destroy

To teardown and remove the resources created in this test:

```sh
terraform destroy -var-file="testing.tfvars" -auto-approve
```