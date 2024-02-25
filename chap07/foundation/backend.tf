terraform {
  backend "cos" {
    region = "ap-guangzhou"
    bucket = "terraform-state-1318912708"
    prefix = "chap07/foundation"
  }
}

