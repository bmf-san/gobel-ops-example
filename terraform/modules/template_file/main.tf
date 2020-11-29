data "template_file" "host_vars" {
  template = file("./templates/host_vars/host.tpl")

  vars = {
    new_user_name = (var.new_user_name)
    new_user_password = (var.new_user_password)
    public_key = (var.public_key)
    ssh_port = (var.ssh_port)
  }
}

resource "local_file" "save_host_vars" {
  content  = (data.template_file.host_vars.rendered)
  filename = "../ansible/inventories/host_vars/${var.host_name}.yml"
}