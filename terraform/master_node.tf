module "master_instance" {
  source = "./modules/instance"
  keypair_name       = (var.master_node.keypair_name)
  path_to_public_key = (var.master_node.path_to_public_key)
  instance_name = (var.master_node.instance_name)
  image_name = (var.master_node.image_name)
  flavor_name = (var.master_node.flavor_name)
  tag_name = (var.master_node.tag_name)
}

data "template_file" "master_hosts" {
  template = file("./templates/hosts.tpl")

  vars = {
    master_host_name=(var.master_node.host_name)
    master_host_ip=(module.master_instance.ip)
    master_path_to_private_key = (var.master_node.path_to_private_key)
  }

  depends_on = [ 
    module.master_instance,
  ]
}

resource "local_file" "save_master_hosts" {
  content  = (data.template_file.master_hosts.rendered)
  filename = "../ansible/inventories/hosts"

  depends_on = [ 
    module.master_instance,
  ]
}

data "template_file" "master_host_vars" {
  template = file("./templates/host_vars/host.tpl")

  vars = {
    master_new_user_name = (var.master_node.new_user_name)
    master_new_user_password = (var.master_node.new_user_password)
    master_public_key = (var.master_node.public_key)
    master_ssh_port = (var.master_node.ssh_port)
  }

  depends_on = [ 
    module.master_instance,
  ]
}

resource "local_file" "master_save_host_vars" {
  content  = (data.template_file.master_host_vars.rendered)
  filename = "../ansible/inventories/host_vars/${var.master_node.host_name}.yml"

  depends_on = [ 
    module.master_instance,
  ]
}
