output "remote_state_foundation" {
  value = data.terraform_remote_state.foundation.outputs
}

output "instance_address" {
  value = tencentcloud_mysql_instance.this.intranet_ip
}

output "instance_port" {
  value = tencentcloud_mysql_instance.this.internet_port
}

output "instance_root_username" {
  value = "root"
}

output "instance_root_password" {
  value     = random_password.root_password.result
  sensitive = true
}

output "db_name" {
  value = tencentcloud_mysql_database.database.db_name
}

output "db_username" {
  value = tencentcloud_mysql_account.user.name
}

output "db_password" {
  value     = random_password.user_password.result
  sensitive = true
}
