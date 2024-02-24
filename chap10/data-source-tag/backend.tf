terraform {
  backend "cos" {
    region = "ap-guangzhou"
    bucket = "terraform-state-1252490918"
    prefix = "chap10/data-source-tag"
  }
}
