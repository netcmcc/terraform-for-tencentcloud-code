
resource "tencentcloud_clb_instance" "this" {
  network_type                 = "OPEN"
  clb_name                     = var.clb.clb_name
  vpc_id                       = data.terraform_remote_state.foundation.outputs.vpc_id
  load_balancer_pass_to_target = true
}


resource "tencentcloud_clb_listener" "listener_tcp_80" {
  clb_id                    = tencentcloud_clb_instance.this.id
  listener_name             = var.clb.listener_name
  port                      = 80
  protocol                  = "TCP"
  health_check_switch       = true
  health_source_ip_type     = 1
  health_check_type         = "HTTP"
  health_check_http_code    = 31
  health_check_http_version = "HTTP/1.1"
  health_check_http_method  = "HEAD"
  health_check_http_path    = "/"
}

### CLB listener API docs link: https://cloud.tencent.com/document/api/214/30693
