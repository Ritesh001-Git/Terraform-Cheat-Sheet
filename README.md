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
