variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Pair"
}

variable "ami" {
  description = "Ubuntu AMI ID"
  default     = "ami-0f5ee92e2d63afc18" # Ubuntu 22.04 (Mumbai)
}

variable "docker_username" {
  description = "Docker Hub username"
}
