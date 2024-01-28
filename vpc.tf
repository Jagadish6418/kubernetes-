terraform {
  required_version = "1.7.1"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}
provider "aws" {
  region =  "us-east-1" 
}
resource "aws_instance" "name" {
  ami ="ami-0c7217cdde317cfec"
  instance_type ="t2.micro"
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF
  tags = {
    app="prod"
  }
}
