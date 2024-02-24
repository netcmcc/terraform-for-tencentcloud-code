resource "tencentcloud_vpc" "vpc" {
  name       = "tag-example"
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "my-vpc"
    Environment = "production"
    Owner       = "team-A"
  }
}
