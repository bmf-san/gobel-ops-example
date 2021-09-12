terraform {
  required_version = "1.0.8"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.35.0"
    }
  }
}

module "instance" {
  source             = "./modules/instance"
  key_pair_name      = (var.instance.key_pair_name)
  path_to_public_key = (var.instance.path_to_public_key)
  instance_name      = (var.instance.instance_name)
  image_name         = (var.instance.image_name)
  flavor_name        = (var.instance.flavor_name)
  tag_name           = (var.instance.tag_name)
}

resource "local_file" "save_hosts" {
  content = templatefile("./templates/hosts.tpl", {
    instance_host_name           = (var.instance.host_name)
    instance_host_ip             = (module.instance.ip)
    instance_user                = (var.instance.new_user_name)
    instance_path_to_private_key = (var.instance.path_to_private_key)
  })
  filename = "../ansible/inventories/hosts"

  depends_on = [
    module.instance,
  ]
}

resource "local_file" "instance_save_host_vars" {
  content = templatefile("./templates/host_vars/host.tpl", {
    host_name           = (var.instance.host_name)
    host_ip             = (module.instance.ip)
    ssh_user_name       = (var.instance.new_user_name)
    ssh_user_password   = (var.instance.new_user_password)
    path_to_private_key = (var.instance.path_to_private_key)
    public_key          = file(var.instance.path_to_public_key)
    ssh_port            = (var.instance.ssh_port)
    domain              = (var.instance.domain)
    email               = (var.instance.email)
  })
  filename = "../ansible/inventories/host_vars/${var.instance.host_name}.yml"

  depends_on = [
    module.instance,
  ]
}
