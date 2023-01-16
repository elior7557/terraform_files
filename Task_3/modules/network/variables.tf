# Network vars

#### Required ####
variable "vpc_name" {
  type        = string
  description = "The name of the first subnet that will be created within the VPC."
}

variable "subnet_names" {
  type        = list(string)
  description = "A list with all subnet names"
}

variable "subnet_az" {
  type        = list(string)
  description = "A list with all subnet AZ"
}




variable "common_tags" {
  type = map(any)
}

#### Optinal ####
variable "subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}


variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}


variable "provision_second_subnet" {
  type        = bool
  default     = true
  description = "Determines whether or not to provision the second subnet."
}

