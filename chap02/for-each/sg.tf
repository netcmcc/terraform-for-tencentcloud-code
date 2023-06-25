resource "tencentcloud_security_group" "this" {
  name        = "${var.server_name}-sg"
  description = "${var.server_name} security group"
}

resource "tencentcloud_security_group_rule" "this" {
  count             = length(var.sg_roles)
  security_group_id = tencentcloud_security_group.this.id
  type              = var.sg_roles[count.index]["type"]
  cidr_ip           = var.sg_roles[count.index]["cidr_ip"]
  ip_protocol       = var.sg_roles[count.index]["ip_protocol"]
  port_range        = var.sg_roles[count.index]["port_range"]
  policy            = var.sg_roles[count.index]["policy"]
  description       = var.sg_roles[count.index]["description"]
}
