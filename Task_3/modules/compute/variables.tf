
### Required ###

variable "ec2_names" {
  type        = list(string)
  description = "names of the ec2"
}

variable "common_tags" {
  type = map(any)
}

// Subents
variable "subnet_ids" {
  type        = list(string)
  description = "The ids of the subnets"

}

variable "vpc_id" {
  type        = string
  description = "The id of vpc"
}


### Optinal ###
// Instances vars
variable "ec2_ami" {
  type    = string
  default = "ami-03c476a1ca8e3ebdc" #eu-west-3 ubuntu
}

variable "ec2_type" {
  type    = string
  default = "t3a.micro"
}


variable "associate_public_ip_address" {
  type    = bool
  default = true
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
  default = "my-tg"
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
  default = "my-lb"
}



variable "provision_second_ec2" {
  type        = bool
  default     = true
  description = "Determines whether or not to provision the second ec2."
}