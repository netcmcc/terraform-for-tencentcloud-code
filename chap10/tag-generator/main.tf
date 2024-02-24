module "tags" {
  source = "github.com/wootile/terraform-tag-generator"

  resource_owner    = "chenming@wootile.com"
  project_name      = "wootile"
  environment_name  = "test"
  terraform_managed = "true"
}

resource "tencentcloud_vpc" "vpc" {
  name       = "tag-example"
  cidr_block = "10.0.0.0/16"

  tags = module.tags.result
}

resource "tencentcloud_subnet" "subnet" {
  vpc_id            = tencentcloud_vpc.vpc.id
  name              = "subnet-example"
  cidr_block        = "10.0.0.0/18"
  availability_zone = "ap-guangzhou-6"

  tags = module.tags.result
}
