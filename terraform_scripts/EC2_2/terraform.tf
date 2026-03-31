terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.5.0"
    }
  }
}

terraform {
  backend "s3"{
    bucket = "remote-ritesh-state-bucket"
    key = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table= "remote_ritesh_state_table"
}
}