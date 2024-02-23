data "terraform_remote_state" "mysql" {
  backend = "cos"
  config = {
    region = "ap-guangzhou"
    bucket = "terraform-state-1252490918"
    prefix = "chap06/remote-state/mysql"
  }
}

# For Illustration only
output "connection_name" {
  value = data.terraform_remote_state.mysql.outputs.endpoint
}
