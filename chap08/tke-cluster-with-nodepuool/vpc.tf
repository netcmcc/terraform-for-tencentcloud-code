module "vpc" {
  source = "github.com/wootile/terraform-tencentcloud-vpc"

  vpc_name = "tke-example-vpc"
  vpc_cidr = "172.20.0.0/16"

  availability_zones = ["ap-guangzhou-6", "ap-guangzhou-7"]
  subnet_cidrs       = ["172.20.0.0/23", "172.20.2.0/23"]
  eni_subnet_cidrs   = ["172.20.8.0/22", "172.20.12.0/22"]
  enable_nat_gateway = true

  tags = {
    "onwer" = "chenming"
  }
}
