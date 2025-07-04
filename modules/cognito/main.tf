resource "aws_cognito_user_pool" "user_pool" {
  name = "employee-directory-user-pool"
}

resource "aws_cognito_user_pool_client" "app_client" {
  name               = "employee-directory-app-client"
  user_pool_id       = aws_cognito_user_pool.user_pool.id
  generate_secret    = false
  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]
}
