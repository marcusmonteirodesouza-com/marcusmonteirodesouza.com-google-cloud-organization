# Deployment

## Bootstrap

1. Create a [Google Cloud project](https://cloud.google.com/resource-manager/docs/creating-managing-projects).
1. Create a [GCS bucket](https://cloud.google.com/storage/docs/creating-buckets) to [store the terraform state](https://cloud.google.com/docs/terraform/resource-management/store-state).
1. `cd` into the [bootstrap folder](./infra/terraform/bootstrap).
1. Create a [`terraform.tfvars`](https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files) file and fill out the variables.
1. Run ` terraform init -backend-config=bucket=<tfstate_bucket>`.
1. Run `terraform apply -target=module.enable_services`.
1. [Connect your Github repository to Cloud Build](https://cloud.google.com/build/docs/automating-builds/github/connect-repo-github?generation=1st-gen).
1. Run `terraform apply`.

## Plan

Open a PR to the `main` branch.

## Production

Push to the `main` branch.