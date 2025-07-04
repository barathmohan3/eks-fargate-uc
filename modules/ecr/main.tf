resource "aws_ecr_repository" "frontend" {
  name = "employee-directory-frontend"
}

resource "aws_ecr_repository" "backend" {
  name = "employee-directory-backend"
}
