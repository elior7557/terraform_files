// this file inclues all infrastructrue related to the ALB
//lb
//tg



# Creation of target group
resource "aws_lb_target_group" "tr-easyway" {
  name     = var.target_group_name
  port     = var.listener_port
  protocol = var.listener_protocol
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    interval            = var.interval
    path                = var.health_check_path

  }
  tags       = var.common_tags
  depends_on = [aws_instance.easyway2]
}

# Attach Ec2 To target Group
resource "aws_lb_target_group_attachment" "mytg" {
  target_group_arn = aws_lb_target_group.tr-easyway.arn
  target_id        = aws_instance.easyway1.id
  port             = 80
  depends_on       = [aws_instance.easyway2]
}

resource "aws_lb_target_group_attachment" "mytg-second" {
  count            = var.provision_second_ec2 ? 1 : 0
  target_group_arn = aws_lb_target_group.tr-easyway.arn
  target_id        = aws_instance.easyway2[0].id
  port             = 80
  depends_on       = [aws_instance.easyway2]
}




# Creation of lb
resource "aws_lb" "mylb" {
  count              = var.provision_second_ec2 ? 1 : 0
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.httpSSH.id]
  subnets            = [var.subnet_ids[0], var.subnet_ids[1]]

  enable_deletion_protection = false
  tags                       = var.common_tags
  depends_on                 = [aws_instance.easyway2]
}


# Lister to alb
resource "aws_lb_listener" "web" {
  count             = var.provision_second_ec2 ? 1 : 0
  load_balancer_arn = aws_lb.mylb[0].arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tr-easyway.arn
  }
  depends_on = [aws_instance.easyway2]
}

