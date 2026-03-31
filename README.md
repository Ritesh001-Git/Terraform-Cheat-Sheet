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

# Common Terraform Blocks

## Resource Block

Defines infrastructure resources.

``` hcl
resource "aws_instance" "app_server" {
  ami           = "ami-12345"
  instance_type = "t2.micro"
}
```

## Variable Block

Defines input variables.

``` hcl
variable "instance_type" {
  default = "t2.micro"
}
```

## Output Block

Displays values after infrastructure is created.

``` hcl
output "instance_ip" {
  value = aws_instance.app_server.public_ip
}
```

------------------------------------------------------------------------

# Terraform Workflow

Terraform follows a standard workflow to deploy infrastructure.

------------------------------------------------------------------------

## 1. Create Terraform Configuration File

First create a Terraform configuration file:

    main.tf

Example:

``` hcl
provider "aws" {
  region = "us-east-1"
}
```

------------------------------------------------------------------------

## 2. Initialize Terraform

Run:

    terraform init

This command:

-   Downloads required **providers**
-   Creates a hidden directory:

```{=html}
<!-- -->
```
    .terraform/

To see hidden files:

    ls -a

------------------------------------------------------------------------

## 3. Validate Terraform Configuration (Optional)

Command:

    terraform validate

This checks:

-   Syntax errors
-   Invalid configuration
-   Missing parameters

------------------------------------------------------------------------

## 4. Terraform Plan

Command:

    terraform plan

This generates an **execution plan**.

It shows:

-   Resources to be created
-   Resources to be modified
-   Resources to be destroyed

Example:

    + create aws_instance.example

### Arguments vs Attributes

**Arguments** - Defined by the user in Terraform configuration. - Used
to configure resources.

Example:

    instance_type = "t2.micro"

**Attributes** - Generated by the provider after resource creation.

Examples:

-   `public_ip`
-   `instance_id`
-   `arn`

Access example:

    aws_instance.app_server.public_ip

------------------------------------------------------------------------

## 5. Apply Infrastructure

Command:

    terraform apply

This:

-   Executes the plan
-   Creates or updates infrastructure
-   Updates the **state file**

Terraform asks for confirmation:

    Do you want to perform these actions?

Type:

    yes

------------------------------------------------------------------------

## 6. Destroy Infrastructure

Command:

    terraform destroy

This removes all resources defined in the Terraform configuration.

Useful for:

-   Cleaning test environments
-   Avoiding unnecessary cloud costs
-   Resetting infrastructure

# Installing and Configuring AWS Provider in Terraform

## 1. Add AWS Provider in Terraform

First open your Terraform configuration file.

You can create or edit the file using:

``` bash
nano terraform.tf
```

or

``` bash
vim terraform.tf
```

Now search on Google for **Terraform AWS Provider** and copy the
provider configuration.

Example configuration:

``` hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
```

This tells Terraform:

-   Which provider to use
-   The source of the provider
-   The compatible version

------------------------------------------------------------------------

# Using Multiple Cloud Providers

Terraform supports **multi-cloud infrastructure**.

You can also add providers like:

### Google Cloud Provider

``` hcl
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
```

### Azure Provider

``` hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
```

This allows Terraform to manage infrastructure across **AWS, Google
Cloud, and Azure**.

------------------------------------------------------------------------

# Connecting AWS CLI to Local Machine

Terraform uses **AWS credentials** from your local system.\
These credentials are configured using **AWS CLI**.

------------------------------------------------------------------------

## Step 1: Install AWS CLI

Download AWS CLI according to your operating system.

Official AWS CLI installation page:

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Follow the commands for:

-   Linux
-   MacOS
-   Windows

After installation verify:

``` bash
aws --version
```

------------------------------------------------------------------------

## Step 2: Create an IAM User in AWS

1.  Login to AWS Console
2.  Open **IAM (Identity and Access Management)**
3.  Click **Users**
4.  Click **Create User**
5.  Give a username

Example:

    terraform-user

------------------------------------------------------------------------

## Step 3: Grant Permissions

Attach required permissions such as:

-   **AmazonS3FullAccess**
-   **AmazonEC2FullAccess**

These permissions allow Terraform to manage AWS resources.

------------------------------------------------------------------------

## Step 4: Create Access Keys

1.  Open the created user
2.  Go to **Security Credentials**
3.  Click **Create Access Key**
4.  Copy:

-   Access Key ID
-   Secret Access Key

Store them safely.

------------------------------------------------------------------------

## Step 5: Configure AWS CLI

Run:

``` bash
aws configure
```

You will be prompted to enter:

    AWS Access Key ID:
    AWS Secret Access Key:
    Default region name:
    Default output format:

Example:

    AWS Access Key ID: AKIAxxxxxxx
    AWS Secret Access Key: xxxxxxxxxxxxxxxxx
    Default region name: ap-south-1
    Default output format: json

After this step your **local machine is connected to AWS**.

Terraform can now create infrastructure using these credentials.

------------------------------------------------------------------------

# Example 1: Create an S3 Bucket using Terraform

[Terraform S3 bucket Script](https://github.com/Ritesh001-Git/Terraform-Cheat-Sheet/blob/main/s3_bucket.tf)

Terraform configuration example:

``` hcl
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "my-terraform-demo-bucket-12345"

  tags = {
    Name        = "TerraformBucket"
    Environment = "Dev"
  }
}
```

This configuration will:

-   Use the AWS provider
-   Create an **S3 bucket**
-   Attach tags to the bucket

------------------------------------------------------------------------

## Deploy the Bucket

Run the Terraform workflow:

``` bash
terraform init
terraform plan
terraform apply
```

After confirmation, Terraform will create the **S3 bucket in your AWS
account**.

------------------------------------------------------------------------

# EC2 Instance using Terraform

This configuration creates an EC2 instance using Terraform.

🔗 **View Full Code:**  
[EC2 Terraform File](https://github.com/Ritesh001-Git/Terraform-Cheat-Sheet/blob/main/terraform_scripts/ec2.tf)

---

## Key Configuration

```hcl
resource "aws_instance" "web" {
  ami           = "ami-12345"
  instance_type = "t2.micro"
}
```

# EC2 + Advanced Terraform Concepts

## SSH Key Generation

To securely connect to your EC2 instance, you need an SSH key.

### Generate SSH Key

``` bash
ssh-keygen
```

-   Creates private and public keys

### Usage

``` bash
ssh -i id_rsa ubuntu@<public-ip>
```

------------------------------------------------------------------------

## Interpolation

Used to reference values from variables/resources.

``` hcl
ami = var.ec2_ami_id
```

------------------------------------------------------------------------

## Security Groups

### Ingress (Inbound Rules)
Defines incoming traffic rules for a resource (e.g., allowing SSH on port 22).

``` hcl
ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
}
```

### Egress (Outbound Rules)
Defines outgoing traffic rules, controlling how a resource can send data outside.

``` hcl
egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All access open outbound"
}
```

------------------------------------------------------------------------

## Variables
A placeholder to store values (like AMI, instance type) to make Terraform configs reusable and flexible.

``` hcl
variable "ec2_ami_id" {
  default = "ami-05d2d839d4f73aafb"
  type = string
}
```

Usage:

``` hcl
ami = var.ec2_ami_id
```

------------------------------------------------------------------------

## Output
Used to display important values (like public IP, ARN) after Terraform execution in the terminal.

``` hcl
output "ec2_public_ip" {
  value = aws_instance.my_instance.public_ip
}
```

------------------------------------------------------------------------

## User Data
A script that runs automatically when an EC2 instance starts, used for setup or installation tasks.

``` hcl
user_data = file("install_ngnix.sh")
```

------------------------------------------------------------------------

## Meta Arguments
Used to create multiple resources dynamically

### count

``` hcl
count = 2
```

``` hcl
output "ec2_public_ip" {
   value = aws_instance.my_instance[*].public_ip
}
```

### for_each
Used to create multiple resources dynamically using a map or set, accessed via each.key and each.value.

``` hcl
for_each = {
    instance_1 = "t3.medium"
    instance_2 = "t3.micro"
}
```

### Loop Output
Used to extract values from multiple resources (like public IPs) using loops or splat ([*]) expressions.

``` hcl
output "ec2_public_ip" {
  value = [
    for k in aws_instance.my_instance : k.public_ip
  ]
}
```

------------------------------------------------------------------------

## depends_on
Explicitly defines resource dependency, ensuring one resource is created before another.

``` hcl
depends_on = [ aws_security_group.my-sg , aws_key_pair.my-key ]
```

------------------------------------------------------------------------

## Conditional
Allows dynamic values based on conditions using syntax like condition ? true_val : false_val.

``` hcl
volume_size = var.env=="prd" ? 20 : 10
```

------------------------------------------------------------------------

## EC2 Resource Example

``` hcl
resource "aws_instance" "my_instance"{

    for_each = {
        instance_1 = "t3.medium"
        instance_2 = "t3.micro"
    }

    depends_on = [ aws_security_group.my-sg , aws_key_pair.my-key ]

    key_name = aws_key_pair.my-key.key_name
    security_groups = [aws_security_group.my-sg.name]

    instance_type = each.value
    ami = var.ec2_ami_id

    root_block_device {
        volume_size = var.env=="prd" ? 20 : 10
        volume_type = "gp3"
    }

    user_data = file("install_ngnix.sh")

    tags = {
        Name = each.key
    }
}
```

# Terraform State

### What is Terraform State?

Terraform state is a file (`terraform.tfstate`) that keeps track of: -
Resources created by Terraform - Current state of infrastructure -
Mapping between configuration and real-world resources

👉 Terraform manages the state of providers (like AWS, Azure), not the
other way around.

------------------------------------------------------------------------

### Important Commands

#### Refresh vs Apply

-   `terraform refresh` → Updates state file with real infrastructure
-   `terraform apply` → Also refreshes state + applies changes

👉 In modern usage, `apply` is generally used instead of `refresh`

------------------------------------------------------------------------

### Terraform State Commands
| Command | Description | Example |
|--------|------------|---------|
| `terraform state list` | Lists all resources in state file | `terraform state list` |
| `terraform state show` | Shows details of a specific resource | `terraform state show aws_instance.my_instance` |
| `terraform state rm` | Removes resource from state (not from cloud) | `terraform state rm aws_key_pair.myKey` |
| `terraform import` | Imports existing resource into Terraform state | `terraform import aws_key_pair.myKey key-id` |

------------------------------------------------------------------------

### Terraform Import Examples

#### Import Key Pair

``` bash
terraform import aws_key_pair.myKey <key-id>
```

------------------------------------------------------------------------

### Import EC2 Instance

First define resource:

``` hcl
resource "aws_instance" "myNewInstance" {
  ami           = "unknown"
  instance_type = "unknown"
}
```

Then run:

``` bash
terraform import aws_instance.myNewInstance <instance-id>
```

------------------------------------------------------------------------

## Terraform State Problem

🚫 Do NOT commit `terraform.tfstate` to GitHub

------------------------------------------------------------------------

<img align="right" alt="GIF" src="https://github.com/Ritesh001-Git/Terraform-Cheat-Sheet/blob/main/terraform-remote-backend-workflow-1-1.gif" width="650" height="420" />


## State Conflict Solution

### Remote Backend + Locking

#### S3 Backend

-   Store state in S3
-   Shared across team

#### DynamoDB Locking

-   Generates Lock ID
-   Prevents simultaneous access

#### Lock Mechanism

-   Lock present → No access
-   Lock released → Access allowed

------------------------------------------------------------------------
