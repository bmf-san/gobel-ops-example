terraform {
  required_version = "0.14.0"
  required_providers {
      openstack = {
        source = "terraform-provider-openstack/openstack"
        version = "1.35.0"
      }
  }
}

module "master_instance" {
  source = "./modules/instance"
  keypair_name       = (var.master_keypair_name)
  path_to_public_key = (var.master_path_to_public_key)
  instance_name = (var.master_instance_name)
  image_name = (var.master_image_name)
  flavor_name = (var.master_flavor_name)
  tag_name = (var.master_tag_name)
}

data "template_file" "hosts" {
  template = file("./templates/hosts.tpl")

  vars = {
    master_host_name=(var.master_host_name)
    master_host_ip=(module.master_instance.ip)
    master_path_to_private_key = (var.master_path_to_private_key)
  }

  depends_on = [ 
    module.master_instance,
  ]
}

resource "local_file" "save_hosts" {
  content  = (data.template_file.hosts.rendered)
  filename = "../ansible/inventories/hosts"

  depends_on = [ 
    module.master_instance,
  ]
}

module "master_template_file" {
  source = "./modules/template_file"
  new_user_name = (var.master_new_user_name)
  new_user_password = (var.master_new_user_password)
  public_key = file(var.master_path_to_public_key)
  ssh_port = (var.master_ssh_port)
  host_name = (var.master_host_name)

  depends_on = [ 
    module.master_instance,
  ]
}
