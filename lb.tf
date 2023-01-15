// this file inclues all infrastructrue related to the ALB
//lb
//tg



# Creation of target group
resource "aws_lb_target_group" "tr-easyway" {
  name     = var.target_group_name
  port     = var.listener_port
  protocol = var.listener_protocol
  vpc_id   = aws_vpc.easyway-elior.id

  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    interval            = var.interval
    path                = var.health_check_path

  }
  tags = local.common_tags
  # tags = merge(local.common_tags, {
  #   Name = "lb-easyWay1-Elior"
  # })

}

# Attach Ec2 To target Group
resource "aws_lb_target_group_attachment" "mytg" {
  count            = 2
  target_group_arn = aws_lb_target_group.tr-easyway.arn
  target_id        = element([aws_instance.easyway1.id, aws_instance.easyway2.id], count.index)
  port             = 80
}


# Creation of lb
resource "aws_lb" "mylb" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.httpSSH.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  enable_deletion_protection = false
  tags                       = local.common_tags
}


# Lister to alb
resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.mylb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tr-easyway.arn
  }
}

