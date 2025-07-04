variable "region" {
  default = "us-west-2"
}

variable "vpc_id" {}
variable "subnets" {
  type = list(string)
}

variable "db_user" {}
variable "db_password" {}

variable "frontend_image" {}
variable "backend_image" {}
