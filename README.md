tech_eazy_devops
AWS Internship Terraform EC2 Deployment

This repository contains Terraform configuration to launch an EC2 instance on AWS with the following features:

Ubuntu 22.04 LTS AMI

Free Tier eligible t3.micro instance

Security Group allowing:

SSH access (port 22)

Application access on port 8080

Outputs the public IP of the EC2 instance

Files in this repository File Description main.tf Main Terraform configuration containing EC2 instance and security group resources variables.tf Variables used in Terraform (region, instance_type, key_pair, ami) outputs.tf Outputs for Terraform, including EC2 public IP Prerequisites

Terraform installed on your local machine or EC2.

AWS account with access key ID and secret access key configured via environment variables or aws configure. export key_pair="my-key.pem"

SSH key pair already created in the AWS region (us-east-1 by default).

Terraform Usage

Initialize Terraform:

terraform init

Check the plan:

terraform plan

Apply configuration:

terraform apply -auto-approve

This will create the EC2 instance and security group as defined in main.tf.

Get the public IP of the EC2 instance:

terraform output my_ec2_public_ip

Access the EC2 Instance ssh -i <your-key.pem> ubuntu@<EC2_PUBLIC_IP>

Make sure <your-key.pem> matches the key pair defined in variables.tf.

Replace <EC2_PUBLIC_IP> with the value from Terraform output.

Security Group

The security group allows:

SSH: 22/tcp from anywhere (0.0.0.0/0)

Application port: 8080/tcp from anywhere (0.0.0.0/0)

note: For production, restrict the CIDR blocks to your IP or trusted network.

Destroy Resources

To clean up and avoid charges:

terraform destroy -auto-approve
