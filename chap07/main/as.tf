data "tencentcloud_images" "this" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "Ubuntu Server 22.04 LTS"
}

resource "tencentcloud_as_scaling_config" "this" {
  configuration_name = var.as.config_name
  image_id           = data.tencentcloud_images.this.images.0.image_id
  instance_types     = var.asg_instance_types
  user_data          = base64encode(file("${path.module}/startup.sh"))
  instance_name_settings {
    instance_name = var.as.instance_name
  }
}

resource "tencentcloud_as_scaling_group" "this" {
  scaling_group_name = var.as.asg_name
  configuration_id   = tencentcloud_as_scaling_config.this.id
  desired_capacity   = var.as.desired_capacity
  min_size           = var.as.min_size
  max_size           = var.as.max_size
  vpc_id             = data.terraform_remote_state.foundation.outputs.vpc_id
  subnet_ids         = data.terraform_remote_state.foundation.outputs.subnet_ids

  forward_balancer_ids {
    load_balancer_id = tencentcloud_clb_instance.this.id
    listener_id      = tencentcloud_clb_listener.listener_tcp_80.listener_id

    target_attribute {
      port   = 80
      weight = 10
    }
  }

}
