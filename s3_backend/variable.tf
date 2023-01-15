// provider
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

variable "aws_provider_version" {
  type    = string
  default = "4.49.0"
}

// Backend
# variable "state_path" {
#   default = "dynamic-way"
# }



// Common Tags
variable "owner" {
  default = "Elior"
}

variable "bootcamp" {
  default = "17"
}

variable "expiration_date" {
  default = "16-01-23"
}


locals {
  common_tags = {
    Owner           = var.owner
    bootcamp        = var.bootcamp
    expiration_date = var.expiration_date
    created_by      = "terraform"
  }
}


// Instances vars
variable "ec2_ami" {
  default = "ami-03c476a1ca8e3ebdc" #eu-west-3 ubuntu
}

variable "ec2_type" {
  default = "t3a.micro"
}

variable "first_ec2_name" {
  default = "easyWay1-Elior"
}

variable "second_ec2_name" {
  default = "easyWay2-Elior"
}

# Network vars
variable "vpc_name" {
  default = "easyName_vpc_elior"
}

variable "subnet_one" {
  default = "public_sb1_easyway_elior"
}

variable "subnet_two" {
  default = "public_sb2_easyway_elior"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_one_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet_two_cidr" {
  default = "10.0.2.0/24"
}

variable "subnet_one_az" {
  default = "eu-west-3a"
}

variable "subnet_two_az" {
  default = "eu-west-3b"
}


// Security Group vars
variable "security_group_name" {
  default = "eliorSG"
}

variable "security_group_description" {
  default = "Allow SSH and HTTP traffic"
}

variable "ssh_port" {
  default = 22
}

variable "http_port" {
  default = 80
}

// Load Balacer vars
variable "target_group_name" {
  default = "tg-easyway"
}

variable "listener_port" {
  default = 80
}

variable "listener_protocol" {
  default = "HTTP"
}

variable "healthy_threshold" {
  default = 2
}

variable "unhealthy_threshold" {
  default = 2
}

variable "timeout" {
  default = 2
}

variable "interval" {
  default = 5
}

variable "health_check_path" {
  default = "/"
}

variable "load_balancer_name" {
  default = "test-lb-easyway"
}
