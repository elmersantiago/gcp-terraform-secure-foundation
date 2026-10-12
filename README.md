# GCP Terraform Secure Foundation

## Project Highlights

A security-focused Google Cloud infrastructure-as-code portfolio project demonstrating Terraform automation, private networking, identity management, Compute Engine security, and continuous integration.

**Project status:** Terraform configuration validated through GitHub Actions. Live Google Cloud deployment has not yet been performed or verified.

### Architecture and Security

| Component | Implementation |
|---|---|
| Infrastructure as Code | Terraform with Google Cloud provider |
| Networking | Custom VPC, regional subnet, Private Google Access |
| Compute | Debian 12 Compute Engine VM without an external IP |
| VM Hardening | Shielded VM with Secure Boot, vTPM, and integrity monitoring |
| Identity | Dedicated Compute Engine service account |
| Access Control | OS Login enabled; project SSH keys blocked |
| Firewall | Internal SSH access restricted by subnet CIDR and VM network tag |
| CI/CD | GitHub Actions for Terraform formatting, initialization, and validation |

### Security Engineering Approach

The architecture separates the VM runtime identity from the Terraform deployment identity. The dedicated VM service account has no project-level IAM roles assigned by this repository's current service account definition.

The configuration follows a least-privilege starting point. Effective permissions, organization policies, remote administrative access, and deployment credentials must be verified before provisioning resources.

### Automated Validation

The GitHub Actions pipeline executes:

- `terraform fmt -check -recursive`
- `terraform init -backend=false`
- `terraform validate -no-color`

The latest reviewed successful workflow was Terraform Validation #13. These checks confirm configuration formatting and structural validity; they do not demonstrate a successful live deployment.

[View Terraform Validation workflow](https://github.com/elmersantiago/gcp-terraform-secure-foundation/actions)

### Deployment Readiness and Operational Controls

A deployment readiness review documents IAM prerequisites, private VM access, Terraform state protection, authentication, cost controls, deployment verification, and rollback planning.

**[Read the Deployment Readiness and Security Review](DEPLOYMENT_READINESS.md)**

The project remains in a CI-validated, pre-deployment state until the required checks and a reviewed Terraform plan are completed.

### Engineering Competencies Demonstrated

Google Cloud Platform · Terraform · Infrastructure as Code · IAM · Compute Engine · VPC Networking · Cloud Security · GitHub Actions · CI/CD · Configuration Validation · Deployment Planning
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
