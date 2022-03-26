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
  instance           = (var.instance)
  path_to_public_key = (var.host.path_to_public_key)
}

resource "local_file" "save_hosts" {
  content = templatefile("./templates/hosts.tpl", {
    host_name           = (var.host.host_name)
    host_ip             = (module.instance.ip)
    ssh_user_name       = (var.host.ssh_user_name)
    path_to_private_key = (var.host.path_to_private_key)
  })
  filename = "../ansible/inventories/hosts"

  depends_on = [
    module.instance,
  ]
}

resource "local_file" "instance_save_host_vars" {
  content = templatefile("./templates/host_vars/host.tpl", {
    ssh_user_name                     = (var.host.ssh_user_name)
    ssh_user_password                 = (var.host.ssh_user_password)
    ssh_port                          = (var.host.ssh_port)
    domain                            = (var.host.domain)
    email                             = (var.host.email)
    ssh_key_name_for_accessing_github = (var.host.ssh_key_name_for_accessing_github)
    application_directory_name        = (var.host.application_directory_name)
    git_repository_name_for_cloning   = (var.host.git_repository_name_for_cloning)
    github_access_token               = (var.host.github_access_token)
    path_to_certificates_directory    = (var.host.path_to_certificates_directory)
    conoha_username                   = (var.conoha.user_name)
    conoha_password                   = (var.conoha.password)
    conoha_tenant_id                  = (var.conoha.tenant_id)
    conoha_region                     = (var.conoha.region)
    public_key                        = chomp(file(var.host.path_to_public_key))
  })
  filename = "../ansible/inventories/host_vars/${var.host.host_name}.yml"

  depends_on = [
    module.instance,
  ]
}
