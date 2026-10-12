# Google Cloud Secure Foundation — Deployment Readiness Review

## Project Overview

This project defines a security-focused Google Cloud infrastructure foundation using Terraform. It demonstrates infrastructure as code, private networking, Compute Engine security controls, service account isolation, and automated validation through GitHub Actions.

**Current status:** Terraform configuration validated through CI. Live infrastructure deployment has not been verified.

## 1. Infrastructure Components

- Custom VPC with automatic subnet creation disabled.
- Regional subnet with Private Google Access enabled.
- Internal SSH firewall rule restricted to the configured subnet CIDR and tagged VM instances.
- Compute Engine VM without an external IP address.
- Shielded VM settings: Secure Boot, vTPM, and integrity monitoring.
- OS Login enabled with project SSH keys blocked.
- Dedicated Compute Engine service account.
- GitHub Actions workflow for Terraform formatting, initialization, and validation.

## 2. Least-Privilege IAM Review

The Compute Engine VM uses a dedicated service account named `secure-foundation-vm`.

No project-level IAM roles are assigned to this service account by the current service account definition. Additional permissions must be justified by specific application requirements.

The `cloud-platform` OAuth scope permits API access only to the extent allowed by the service account's IAM permissions.

Before deployment:

- Verify effective IAM permissions and inherited grants.
- Separate the Terraform deployment identity from the VM runtime identity.
- Grant the deployment identity only the permissions required to provision and manage the resources.
- Verify authorization to attach the VM service account.
- Avoid long-lived service account keys.
- Configure OS Login IAM permissions for approved administrators only.

## 3. Network Security Review

The VM is configured without an external IP address.

The existing SSH firewall rule permits TCP port 22 from the configured subnet CIDR to instances with the `internal-ssh` tag.

Before deployment, verify that this rule matches the intended administrative access model. For remote administration, evaluate Identity-Aware Proxy TCP forwarding, its required firewall source ranges, and the relevant IAM permissions.

Do not assume that enabling OS Login alone provides network connectivity to the VM.

## 4. Deployment Prerequisites

The following items must be verified before a live Terraform deployment:

- A designated Google Cloud project with billing enabled.
- Required Google Cloud APIs enabled.
- Approved Terraform authentication method.
- Correct project, region, zone, and subnet configuration.
- Appropriate organization policies and service account permissions.
- Secure remote Terraform state storage with restricted access.
- No secrets or state files committed to GitHub.
- Review of expected resource costs.
- Successful `terraform plan` reviewed before `terraform apply`.

## 5. CI/CD Validation

GitHub Actions performs:

1. `terraform fmt -check -recursive`
2. `terraform init -backend=false`
3. `terraform validate -no-color`

These checks validate configuration formatting and structure. They do not provision infrastructure, verify runtime security, or replace a deployment plan and policy review.

## 6. Deployment and Rollback

A production deployment requires an approved change procedure, reviewed Terraform plan, resource verification, and documented rollback strategy.

Before any deployment, establish:

- Resource ownership and change approval.
- Terraform state protection and recovery procedures.
- Post-deployment connectivity and security tests.
- Cost monitoring and logging requirements.
- A documented teardown procedure using a reviewed `terraform destroy` plan when appropriate.

## 7. Readiness Decision

**Status: CI-validated; live deployment not yet approved.**

The project is suitable for demonstrating Terraform, Google Cloud infrastructure design, and security-conscious engineering practices in a technical portfolio.

Live deployment remains subject to IAM, networking, authentication, state management, cost, and operational verification.
