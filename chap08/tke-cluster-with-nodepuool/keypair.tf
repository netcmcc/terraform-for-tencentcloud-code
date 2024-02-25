module "keypair" {
  source = "github.com/wootile/terraform-tencentcloud-keypair"

  key_name            = "tke_example_key"
  ssh_public_key_path = "./secrets"
  generate_ssh_key    = true
}
