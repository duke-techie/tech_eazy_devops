variable "region" {
  default = "us-east-1" # N.Virginia
}

variable "instance_type" {
  default = "t3.micro"   # Free Tier eligible
}

variable "key_pair" {
  description = "EC2 Key pair name"
  default     = "my-key"  # Replace with your key pair
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0bbdd8c17ed981ef9" # Amazon Ubuntu Server 22.04 LTS, Free Tier
}
