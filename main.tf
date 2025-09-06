provider "aws" {
  region = var.region
}

resource "aws_security_group" "ec2_sg" {
  name        = "terraform-ec2-sg"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # App access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_pair
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "TF-EC2"
  }
}
