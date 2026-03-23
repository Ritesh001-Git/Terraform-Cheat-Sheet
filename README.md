# Terraform Cheer Sheet

## What is Terraform?

**Terraform** is an open-source Infrastructure as Code (IaC) tool created by **HashiCorp** that allows developers and DevOps engineers to define and manage infrastructure using declarative configuration files.

Instead of manually creating infrastructure like servers, networks, and databases through a cloud console, Terraform allows you to describe infrastructure in code using **HCL (HashiCorp Configuration Language)**.

Terraform then automatically provisions and manages the resources across multiple cloud providers.

### Brief History

- **2014** – Terraform was introduced by HashiCorp.
- It quickly gained popularity due to its **multi-cloud support** and **declarative configuration model**.
- Over time it became one of the most widely used tools for **Infrastructure as Code in DevOps workflows**.

### Current Trends and Developments

- Terraform is heavily used in **multi-cloud environments** (AWS, Azure, GCP).
- Many organizations use Terraform with **CI/CD pipelines** for automated infrastructure deployment.
- The Terraform ecosystem continues to grow with **Terraform Cloud, Terraform Enterprise, and provider plugins**.
- There is increasing focus on **policy enforcement, security scanning, and automated infrastructure governance**.

---

## What is Infrastructure as Code (IaC)?

**Infrastructure as Code (IaC)** is the practice of managing and provisioning infrastructure through **machine-readable configuration files instead of manual processes**.

Using IaC, infrastructure is treated the same way as application code.

### Key Principles of IaC

- Version-controlled infrastructure
- Automated provisioning
- Reproducible environments
- Reduced human error
- Faster deployments

### Why IaC Matters

1. **Consistency** – Same infrastructure can be recreated across environments.
2. **Automation** – Infrastructure can be deployed automatically using pipelines.
3. **Scalability** – Large infrastructures can be managed efficiently.
4. **Collaboration** – Teams can review infrastructure changes via pull requests.
5. **Disaster Recovery** – Entire environments can be rebuilt quickly.

---

## Terraform vs Ansible

| Feature | Terraform | Ansible |
|------|------|------|
| Primary Purpose | Infrastructure provisioning | Configuration management |
| Language | HCL | YAML |
| State Management | Maintains state file | Stateless |
| Execution Model | Declarative | Procedural |
| Best Use Case | Creating infrastructure resources | Configuring software on servers |

### Example

- Use **Terraform** to create:
  - EC2 instances
  - VPC networks
  - Load balancers

- Use **Ansible** to configure:
  - Install Docker
  - Setup Nginx
  - Deploy application code

Many DevOps teams use **Terraform + Ansible together**.

---

## Terraform vs AWS CloudFormation

| Feature | Terraform | CloudFormation |
|------|------|------|
| Provider Support | Multi-cloud | AWS only |
| Language | HCL | JSON / YAML |
| Community | Large open-source ecosystem | AWS ecosystem |
| Flexibility | Works with many providers | Limited to AWS services |
| State Management | Local or remote state | Managed internally by AWS |

### When to Use Terraform

- Multi-cloud deployments
- Hybrid cloud environments
- Cross-platform infrastructure

### When to Use CloudFormation

- AWS-only infrastructure
- Deep AWS integration
- Native AWS service support

---

# Terraform Architecture

Terraform follows a **declarative architecture** where users define the desired infrastructure state and Terraform determines how to reach that state.

### Key Components

**1. Terraform Core**
- The main engine of Terraform.
- Reads configuration files.
- Builds an **execution plan**.
- Communicates with providers to create or update infrastructure.

**2. Providers**
- Plugins that allow Terraform to interact with different platforms.
- Examples include:
  - AWS
  - Azure
  - Google Cloud
  - Kubernetes
  - GitHub

Providers translate Terraform configurations into **API calls** to the target platform.

**3. State File**
- Terraform maintains a **state file (`terraform.tfstate`)** to track infrastructure.
- This allows Terraform to know:
  - What resources already exist
  - What needs to change

Interviewers often ask:
- Why Terraform needs a **state file**
- What happens if the state file is lost
- How **remote state storage** works

---

# HCL (HashiCorp Configuration Language)

**HCL** stands for **HashiCorp Configuration Language**.

It is the language used by Terraform to define infrastructure.

### Characteristics of HCL

- Human-readable
- Declarative
- Supports variables and expressions
- Easy to learn compared to JSON or YAML

Terraform configurations are usually written in files with the extension: `.tf`

Example:

```hcl
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
```

# Basic Terraform Configuration Structure
A Terraform configuration mainly consists of blocks, parameters, and arguments.

General Structure
```
block_type "label1" "label2" {
  argument = value
}
```

## Components

### Block

Blocks define infrastructure components.

Examples:

-   `resource`
-   `variable`
-   `output`
-   `provider`
-   `module`

Example:

``` hcl
resource "aws_instance" "web_server" {
  ami           = "ami-12345"
  instance_type = "t2.micro"
}
```

------------------------------------------------------------------------

### Parameters

Parameters are identifiers used inside blocks.

Example parameters:

-   `ami`
-   `instance_type`
-   `region`

Example:

``` hcl
provider "aws" {
  region = "us-east-1"
}
```

------------------------------------------------------------------------

### Arguments

Arguments assign values to parameters.

Example:

    instance_type = "t2.micro"

Here:

-   `instance_type` → parameter\
-   `"t2.micro"` → argument value

------------------------------------------------------------------------

