# Output varaible defenitions

output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_ids" {
  value = module.network.subnet_ids
}


output "ec2_id_1" {
  value = module.compute.ec2_id_1
}

output "ec2_id_2" {
  value = module.compute.ec2_id_2
}

output "lb_id" {
  value = module.compute.lb_id
}