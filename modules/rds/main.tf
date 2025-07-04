resource "aws_db_instance" "employee_db" {
  identifier        = "employee-db"
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  name              = "employeedb"
  username          = var.db_user
  password          = var.db_password
  skip_final_snapshot = true
  publicly_accessible = false
}
