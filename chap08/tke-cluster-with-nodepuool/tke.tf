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
  enabled_nginx_ingress_controller = true

  fixed_node = {
    desired_capacity = 1
    instance_type    = "SA3.LARGE16"
    system_disk_size = 100
  }

  node_pools = {
    example-ng = {
      desired_size      = 1
      min_size          = 1
      max_size          = 3
      enable_auto_scale = false
      instance_type     = "SA3.LARGE16"
      system_disk_size  = 100

      labels = {
        product = "tke-example"
      }
    }
  }

  tags = {
    "onwer" = "chenming"
  }

  depends_on = [module.vpc]

}
