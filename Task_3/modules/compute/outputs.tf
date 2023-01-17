# Output varaible defenitions

output "ec2_id_1" {
  value = aws_instance.easyway1.id
}

output "ec2_id_2" {
  value = var.provision_second_ec2 ? aws_instance.easyway2[0].id : "N/A"
}

output "lb_id" {
  value = var.provision_second_ec2 ? aws_lb.mylb[0].id : "N/A"
}