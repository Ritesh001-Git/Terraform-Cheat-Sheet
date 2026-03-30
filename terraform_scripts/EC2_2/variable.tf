variable "aws_instance_type" {
  default = "t3.micro"
  type = string
}

variable "aws_root_storage_size" {
  default = 15
  type = number
}

variable "ec2_ami_id" {
  default = "ami-05d2d839d4f73aafb"
  type = string
}

variable "env" {
  default = "dev"
  type = string
}