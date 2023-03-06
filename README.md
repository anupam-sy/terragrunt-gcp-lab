# Terragrunt GCP Lab
This repository contains terragrunt code to deploy infrastructure on google cloud platform. Terragrunt is a thin wrapper for Terraform that provides extra tools for keeping your configurations DRY.

## Prerequisites
Below prerequisites must be fulfilled for successful execution of terraform concept code sets.

### Software Requirement
Resources in this repository are meant to use with Terraform 1.3.6 & Terragrunt 0.43.2 versions. If you don't have the compatible version, download it from respective official repositories.

-   [Cloud SDK](https://cloud.google.com/sdk/install) >= 414.0.0
-   [Terraform](https://www.terraform.io/downloads.html) >= 1.3.6
-   [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/) >= 0.43.2

> **Note:** 
> See [Installation-Guide](https://gist.github.com/anupam-sy/7458df6506e8e3cfb28c0ff56fab546a) on how to install Terraform.

## Terraform Code Execution
To execute the Terraform code present under "tf_envs" folder, go to command prompt and cd to respective directory then run the following commands:

-   [Required] `terraform init` # To initialize the terraform working directory.
-   [Optional] `terraform validate` # To validate the terraform configuration.
-   [Optional] `terraform fmt` # To format the terraform configuration to a canonical format and style.
-   [Optional] `terraform plan` # To create an execution plan for terraform configuration files.
-   [Required] `terraform apply -auto-approve` # To execute the actions proposed in a terraform plan to create, update, or destroy infrastructure.
-   [Optional] `terraform destroy -auto-approve` # To destroy the created infrastructure. Specific resources can be destroyed using resource targetting.

## Terragrunt Code Execution
To execute the Terragrunt code present under "tg_envs" folder, go to command prompt and cd to respective directory and then run the following commands:

-   [Required] `terragrunt init` # To initialize the terragrunt working directory.
-   [Optional] `terragrunt validate` # To validate the terraform configuration.
-   [Optional] `terragrunt plan` # To create an execution plan for terraform configuration files.
-   [Optional] `terragrunt hclfmt` # To recursively find hcl files and rewrite them into a canonical format.
-   [Required] `terragrunt apply -auto-approve` # To execute the actions proposed in a terragrunt plan to create, update, or destroy infrastructure.
-   [Optional] `terragrunt destroy -auto-approve` # To destroy the created infrastructure.

## References
- https://terragrunt.gruntwork.io/docs/#getting-started
- https://terragrunt.gruntwork.io/docs/features/keep-your-terraform-code-dry/
- https://terragrunt.gruntwork.io/docs/reference/cli-options/