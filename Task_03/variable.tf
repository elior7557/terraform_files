// provider
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "aws_provider_version" {
  type    = string
  default = "4.49.0"
}

variable "provision_second_subnet" {
  type    = bool
  default = true

}

variable "provision_second_ec2" {
  type    = bool
  default = true
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

variable "ec2_names" {
  type    = list(any)
  default = ["ec2_one", "ec2_two"]
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}

# Network vars
variable "vpc_name" {
  type    = string
  default = "RightName_vpc_elior"
}


variable "subnet_names" {
  type    = list(any)
  default = ["pub_sub1", "pub_sub2"]
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

variable "subnet_az" {
  type    = list(any)
  default = ["eu-central-1a", "eu-central-1b"]
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
  default = "tg-Rightway"
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
  default = "test-lb-Rightway"
}
