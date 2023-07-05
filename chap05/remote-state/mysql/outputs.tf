output "endpoint" {
  value = "${tencentcloud_mysql_instance.this.intranet_ip}:3306"
}
