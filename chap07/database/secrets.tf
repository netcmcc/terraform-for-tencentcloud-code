resource "random_password" "root_password" {
  length           = 16
  special          = true
  override_special = "_#!"
  min_special      = 1
  min_numeric      = 1
}

resource "random_password" "user_password" {
  length           = 16
  special          = true
  override_special = "_#!"
  min_special      = 1
  min_numeric      = 1
}
