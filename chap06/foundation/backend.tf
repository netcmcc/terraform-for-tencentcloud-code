terraform {
  backend "cos" {
    region = "ap-guangzhou"
    bucket = "terraform-state-1252490918"
    prefix = "chap06/foundation"
  }
}

data "terraform_remote_state" "foundation" {
  backend = "cos"
  config = {
    region = "ap-guangzhou"
    bucket = "terraform-state-1252490918"
    prefix = "chap06/foundation"
  }
}
