# AWSIacFinal

This repository contains Infrastructure as Code (IaC) templates and modules for deploying a secure, production-grade AWS environment using both Terraform and AWS CloudFormation. It is designed for DevSecOps best practices and supports a modern SaaS finance application architecture.

## 📁 Directory Structure

- `cloudformation/` — AWS CloudFormation YAML templates for EC2, RDS, and S3, plus architecture diagrams.
- `terraform/` — Modular Terraform code for VPC, EC2, RDS, and S3, with state management and outputs.
- `terraform/modules/` — Reusable Terraform modules for each AWS resource.

## 🚀 Quick Start

### Prerequisites
- AWS CLI configured (`aws configure`)
- Terraform v1.3+
- AWS account with sufficient permissions

### Deploy with Terraform
1. `cd terraform`
2. Edit `terraform.tfvars` with your values
3. `terraform init`
4. `terraform plan`
5. `terraform apply`

### Deploy with CloudFormation
1. `cd cloudformation`
2. Use the AWS CLI to create stacks, e.g.:
   ```sh
   aws cloudformation create-stack --stack-name my-stack --template-body file://ec2.yaml --parameters ...
   