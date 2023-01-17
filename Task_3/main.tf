
module "network" {
  source                  = "./modules/network"
  vpc_name                = var.vpc_name
  subnet_names            = var.subnet_names
  subnet_az               = var.subnet_az
  common_tags             = local.common_tags
  provision_second_subnet = var.provision_second_subnet

}

module "compute" {
  source               = "./modules/compute"
  ec2_names            = var.ec2_names
  ec2_ami              = "ami-0039da1f3917fa8e3"
  subnet_ids           = module.network.subnet_ids
  vpc_id               = module.network.vpc_id
  common_tags          = local.common_tags
  load_balancer_name   = "my-lb-${terraform.workspace}"
  target_group_name    = "mytg-${terraform.workspace}"
  provision_second_ec2 = var.provision_second_ec2
}