provider "aws" {
  region = var.region
}

# Security Group
resource "aws_security_group" "devops_sg" {
  name = "devops-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Backend Instance
resource "aws_instance" "backend" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = [aws_security_group.devops_sg.name]

  user_data = templatefile("${path.module}/user-data-backend.sh", {
    docker_username = var.docker_username
  })

  tags = {
    Name = "Backend-Server"
  }
}

# Frontend Instance
resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = [aws_security_group.devops_sg.name]

  user_data = templatefile("${path.module}/user-data-frontend.sh", {
    docker_username = var.docker_username
  })

  tags = {
    Name = "Frontend-Server"
  }
}
