module "worker_instance" {
  for_each = var.worker_nodes

  source = "./modules/instance"
  keypair_name       = (each.value.keypair_name)
  path_to_public_key = (each.value.path_to_public_key)
  instance_name = (each.value.instance_name)
  image_name = (each.value.image_name)
  flavor_name = (each.value.flavor_name)
  tag_name = (each.value.tag_name)
}

data "template_file" "worker_hosts" {
  for_each = var.worker_nodes

  template = file("./templates/hosts.tpl")

  vars = {
      worker_nodes = var.worker_nodes
  }

  depends_on = [ 
    module.worker_instance,
  ]
}

resource "local_file" "worker_save_hosts" {
  content  = (data.template_file.worker_hosts.rendered)
  filename = "../ansible/inventories/hosts"

  depends_on = [ 
    module.worker_instance,
  ]
}

data "template_file" "worker_host_vars" {
  for_each = var.worker_nodes

  template = file("./templates/host_vars/host.tpl")

  vars = {
    worker_nodes = var.worker_nodes
  }

  depends_on = [ 
    module.worker_instance,
  ]
}

resource "local_file" "worker_save_host_vars" {
  content  = (data.template_file.worker_host_vars.rendered)
  filename = "../ansible/inventories/host_vars/${var.host_name}.yml"

  depends_on = [ 
    module.worker_instance,
  ]
}