# GCP Terraform Secure Foundation

## Project Overview

A Google Cloud infrastructure-as-code project demonstrating Terraform-based provisioning, cloud networking, Compute Engine configuration, and automated infrastructure validation.

**Technologies:** Google Cloud Platform (GCP), Terraform, VPC Networking, Compute Engine, GitHub Actions

## Architecture

The project organizes Google Cloud infrastructure into reusable Terraform configuration files.

- **providers.tf** — Terraform and Google Cloud provider configuration
- **main.tf** — Infrastructure resources, including VPC networking and Compute Engine
- **variables.tf** — Configurable infrastructure inputs
- **outputs.tf** — Infrastructure output values
- **terraform.tfvars.example** — Example environment configuration
- **.github/workflows/terraform-validate.yml** — Automated Terraform validation

## Infrastructure and Security

The project focuses on:

- Infrastructure provisioning through version-controlled Terraform
- Google Cloud VPC networking
- Configurable Compute Engine resources
- Parameterized infrastructure configuration
- Terraform formatting and configuration validation
- Separation of example configuration from environment-specific values

Security settings and access controls should be reviewed before deploying this example to any production environment.

## CI/CD Pipeline

GitHub Actions automatically validates Terraform configuration changes.

The workflow performs:

1. Repository checkout
2. Terraform installation
3. Terraform formatting verification
4. Terraform initialization without configuring a remote backend
5. Terraform configuration validation

This helps identify formatting and configuration errors before infrastructure deployment.

## Getting Started

### Prerequisites

- Terraform CLI
- Google Cloud project
- Appropriate Google Cloud credentials and permissions
- Required Google Cloud APIs enabled

### Validation

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
```

### Deployment

Review the Terraform resources and required permissions before applying the configuration.

```bash
terraform init
terraform plan
terraform apply
```

**Important:** Running `terraform apply` may create billable Google Cloud resources. Review the plan and security configuration before proceeding.

## Project Status

Terraform formatting and validation have passed in GitHub Actions.

This repository demonstrates infrastructure-as-code and CI validation. A successful validation workflow does not by itself establish that infrastructure has been deployed or security-tested in a live Google Cloud environment.

## Author

**Elmer Santiago**  
Senior Cloud & DevOps Engineer

[GitHub Profile](https://github.com/elmersantiago)
