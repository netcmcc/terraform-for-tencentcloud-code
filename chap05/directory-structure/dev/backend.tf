terraform {
  backend "cos" {
    region = "ap-guangzhou"
    bucket = "terraform-state-1252490918"
    prefix = "chap05/directory-structure/dev"
  }
}
