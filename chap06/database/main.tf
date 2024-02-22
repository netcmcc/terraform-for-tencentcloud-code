resource "tencentcloud_security_group" "this" {
  name        = join("-", [var.db_settings.instance_name, "sg"])
  description = join("-", [var.db_settings.instance_name, "sg"])
}

resource "tencentcloud_security_group_lite_rule" "this_lite_rule" {
  security_group_id = tencentcloud_security_group.this.id
  ingress = [
    "ACCEPT#${data.terraform_remote_state.foundation.outputs.vpc_cidr}#3306#TCP"
  ]
}

resource "random_password" "root_password" {
  length           = 16
  special          = true
  override_special = "_#!"
  min_special      = 1
  min_numeric      = 1
}

resource "random_password" "user_password" {
  length           = 16
  special          = true
  override_special = "_#!"
  min_special      = 1
  min_numeric      = 1
}

resource "tencentcloud_mysql_instance" "this" {
  instance_name   = var.db_settings.instance_name
  engine_version  = var.db_settings.engine_version
  charge_type     = "POSTPAID"
  root_password   = random_password.root_password.result
  cpu             = var.db_settings.cpu
  mem_size        = var.db_settings.mem_size * 1000
  volume_size     = var.db_settings.volume_size
  security_groups = [tencentcloud_security_group.this.id]

  vpc_id            = data.terraform_remote_state.foundation.outputs.vpc_id
  subnet_id         = data.terraform_remote_state.foundation.outputs.subnet_ids[0]
  slave_deploy_mode = 1
  slave_sync_mode   = 1
  availability_zone = data.terraform_remote_state.foundation.outputs.zones[0]
  first_slave_zone  = data.terraform_remote_state.foundation.outputs.zones[1]
  internet_service  = 1

  parameters = {
    character_set_server = "utf8mb4"
    max_connections      = "1000"

  }
}

resource "tencentcloud_mysql_database" "database" {
  instance_id        = tencentcloud_mysql_instance.this.id
  db_name            = var.db_settings.db_name
  character_set_name = "utf8mb4"
}

resource "tencentcloud_mysql_account" "user" {
  mysql_id             = tencentcloud_mysql_instance.this.id
  name                 = var.db_settings.db_user
  password             = random_password.user_password.result
  max_user_connections = 1000
}

resource "tencentcloud_mysql_privilege" "database" {
  mysql_id     = tencentcloud_mysql_instance.this.id
  account_name = tencentcloud_mysql_account.user.name
  global       = ["TRIGGER"]
  database {
    privileges    = ["SELECT", "INSERT", "UPDATE", "DELETE", "CREATE"]
    database_name = var.db_settings.db_name
  }
}
