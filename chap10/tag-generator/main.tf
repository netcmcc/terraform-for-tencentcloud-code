module "tags" {
  source = "github.com/wootile/terraform-tag-generator"

  resource_owner    = "chenming@wootile.com"
  project_name      = "wootile"
  environment_name  = "test"
  terraform_managed = "true"
}

resource "tencentcloud_vpc" "vpc" {
  name         = "tag-example"
  cidr_block   = "10.0.0.0/16"
  dns_servers  = ["119.29.29.29", "8.8.8.8"]
  is_multicast = false

  tags = module.tags.result
}
