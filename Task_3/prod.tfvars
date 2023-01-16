vpc_name     = "rightWay-prod"
subnet_names = ["subnet_prod1", "subnet_prod1"]
subnet_az    = ["eu-central-1a", "eu-central-1b"]
ec2_ami      = "ami-0039da1f3917fa8e3"
# FrankFuart
common_tags = local.common_tags

ec2_names               = ["prod_first", "prod_second"]
provision_second_subnet = false
provision_second_ec2    = false