data "tencentcloud_user_info" "current" {}

resource "tencentcloud_vpc" "vpc" {
  name       = "tag-example"
  cidr_block = "10.0.0.0/16"

  tags = {
    Owner = data.tencentcloud_user_info.current.name
  }
}
