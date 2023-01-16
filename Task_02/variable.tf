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


// Common Tags
variable "owner" {
  type    = string
  default = "Elior"
}

variable "bootcamp" {
  type    = string
  default = "17"
}

variable "expiration_date" {
  type    = string
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
  type    = string
  default = "ami-03c476a1ca8e3ebdc" #eu-west-3 ubuntu
}

variable "ec2_type" {
  type    = string
  default = "t3a.micro"
}

variable "first_ec2_name" {
  type    = string
  default = "easyWay1-Elior"
}

variable "second_ec2_name" {
  type    = string
  default = "easyWay2-Elior"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
}

# Network vars
variable "vpc_name" {
  type    = string
  default = "easyName_vpc_elior"
}

variable "subnet_one" {
  type    = string
  default = "public_sb1_easyway_elior"
}

variable "subnet_two" {
  type    = string
  default = "public_sb2_easyway_elior"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_one_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet_two_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "subnet_one_az" {
  type    = string
  default = "eu-west-3a"
}

variable "subnet_two_az" {
  type    = string
  default = "eu-west-3b"
}


// Security Group vars
variable "security_group_name" {
  type    = string
  default = "eliorSG"
}

variable "security_group_description" {
  type    = string
  default = "Allow SSH and HTTP traffic"
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "http_port" {
  type    = number
  default = 80
}

// Load Balacer vars
variable "target_group_name" {
  type    = string
  default = "tg-easyway"
}

variable "listener_port" {
  type    = number
  default = 80
}

variable "listener_protocol" {
  type    = string
  default = "HTTP"
}

variable "healthy_threshold" {
  type    = number
  default = 2
}

variable "unhealthy_threshold" {
  type    = number
  default = 2
}

variable "timeout" {
  type    = number
  default = 2
}

variable "interval" {
  type    = number
  default = 5
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "load_balancer_name" {
  type    = string
  default = "test-lb-easyway"
}
