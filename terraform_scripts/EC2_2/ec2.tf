# Key-Pair
resource "aws_key_pair" "my-key" {
  key_name = "deployer-key"
  public_key = file("../terra-key-ec2.pub")
}
# VPC
resource "aws_default_vpc" "default"{

}
# Security Group
resource "aws_security_group" "my-sg"{
    name = "my_sg_1"
    description = "A TF generated SG"
    vpc_id = aws_default_vpc.default.id # Interpolation

    # Inbound Rules
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
    }
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP open"
    }
    # Outbound Rules
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1" # semantically equivalent to all ports
        cidr_blocks = ["0.0.0.0/0"]
        description = "All access open outbound"
    }
    tags = {
        Name = "my_sg_1"
    }
}
#ec2 instance
resource "aws_instance" "my_instance"{
    # count = 2 # Meta Argument
    for_each = ({
        instance_1 = "t3.medium"
        instance_2 = "t3.micro"
    })
    depends_on = [ aws_security_group.my-sg , aws_key_pair.my-key ]
    key_name = aws_key_pair.my-key.key_name
    security_groups = [aws_security_group.my-sg.name]
    instance_type = each.value
    ami = var.ec2_ami_id #ubuntu
    root_block_device {
        # volume_size = 10
        volume_size = var.env=="prd" ? 20 : 10
        volume_type = "gp3"
    }
    user_data = file("install_ngnix.sh")
    tags = {
        Name = each.key
    }
}