clb = {
  clb_name             = "three-tier-clb"
  listener_name        = "listener_tcp_80"
  forward_rule_name    = "fwd-three-tier"
  backend_service_name = "bs-three-tier"
  url_map_name         = "lb-three-tier"
  target_proxy_name    = "proxy-three-tier"
}

as = {
  instance_name    = "three-tier"
  asg_name         = "asg-three-tier"
  config_name      = "config-three-tier"
  desired_capacity = 2
  min_size         = 2
  max_size         = 3
}

asg_instance_types = ["S5.MEDIUM2", "S5.MEDIUM4"]
