resource "aws_lb" "app_lb" {
  name               = "employee-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets
  security_groups    = []
}
