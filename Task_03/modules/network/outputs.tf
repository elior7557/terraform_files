
# Output varaible defenitions

# VPC ID
output "vpc_id" {
  description = "ID of VPC"
  value       = aws_vpc.easyway-elior.id
}

#Subnet ID's
output "subnet_ids" {
  description = "ID of subnets"
  value       = tolist(aws_subnet.public-subnets[*].id)
}
