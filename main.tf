provider "aws" {
  region = var.region
}

module "eks" {
  source = "./modules/eks"
  vpc_id = var.vpc_id
  subnets = var.subnets
}

module "rds" {
  source = "./modules/rds"
  db_user = var.db_user
  db_password = var.db_password
}

module "secrets" {
  source = "./modules/secrets"
  db_user = var.db_user
  db_password = var.db_password
}

module "alb" {
  source = "./modules/alb"
  vpc_id = var.vpc_id
  subnets = var.subnets
}

module "frontend" {
  source = "./modules/frontend"
  frontend_image = var.frontend_image
}

module "backend" {
  source = "./modules/backend"
  backend_image = var.backend_image
}
