module "tke" {
  source = "github.com/wootile/terraform-tencentcloud-tke"

  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.subnet_ids
  availability_zones = module.vpc.availability_zones
  eni_subnets        = module.vpc.eni_subnet_ids

  cluster_name                     = "tke-example-cluster"
  cluster_version                  = "1.26.1"
  key_pair_id                      = module.keypair.key_pair_id
  cluster_endpoint_ingress_cidrs   = ["0.0.0.0/0"]
  worker_allow_ingress_cidrs       = [module.vpc.vpc_cidr]
  enabled_nginx_ingress_controller = false

  fixed_node = {
    desired_capacity = 1
    instance_type    = "SA3.LARGE16"
    system_disk_size = 100
  }

  tags = {
    "onwer" = "chenming"
  }

  depends_on = [module.vpc]

}

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

module "keypair" {
  source = "github.com/wootile/terraform-tencentcloud-keypair"

  key_name            = "tke_example_key"
  ssh_public_key_path = "./secrets"
  generate_ssh_key    = true
}