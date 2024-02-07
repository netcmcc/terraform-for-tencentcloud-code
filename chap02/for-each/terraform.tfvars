server_name = "foreach"

vpc_name = "my-network"
vpc_cidr = "192.168.0.0/16"

subnets = {
  guangzhou-three = { "zone" : "ap-guangzhou-6", "ip_cidr_block" : "192.168.1.0/24" },
  guangzhou-four  = { "zone" : "ap-guangzhou-7", "ip_cidr_block" : "192.168.2.0/24" },
}

sg_roles = [
  {
    "description" : "allow-all-internal",
    "type" : "ingress",
    "cidr_ip" : "192.168.0.0/16",
    "ip_protocol" : null,
    "port_range" : null,
    "policy" : "ACCEPT",
  },
  {
    "description" : "egress-allow-all",
    "type" : "egress",
    "cidr_ip" : "0.0.0.0/0",
    "ip_protocol" : null,
    "port_range" : null,
    "policy" : "ACCEPT",
  },
  {
    "description" : "allow-http",
    "type" : "ingress",
    "cidr_ip" : "0.0.0.0/0",
    "ip_protocol" : "TCP",
    "port_range" : "80",
    "policy" : "ACCEPT",
  },
]
