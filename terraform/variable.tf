variable "conoha" {
  type = object({
    user_name                 = string # conoha api user name
    password                  = string # conoha api password
    tenant_name               = string # conoha tenant name
    tenant_id                 = string # conoha tenant id
    identity_service_endpoint = string # conoha identity service endpoint
    region                    = string # conoha region name
  })
  default = {
    user_name                 = "user1234"
    password                  = "password1234"
    tenant_name               = "tenant1234"
    tenant_id                 = "id1234"
    identity_service_endpoint = "https://identity.tyo2.conoha.io/v2.0"
    region                    = "tyo2"
  }
  description = "settings for a conoha"
}

variable "instance" {
  type = object({
    security_groups = list(any) # cf. https://www.conoha.jp/docs/neutron-get_secgroups_list.php
    key_pair_name   = string    # ssh key pair name for instance
    instance_name   = string    # instance name
    image_name      = string    # cf. https://www.conoha.jp/docs/image-get_images_list.php
    flavor_name     = string    # cf. https://www.conoha.jp/docs/compute-get_flavors_list.php
    tag_name        = string    # name tag for instance
  })
  default = {
    security_groups = [
      "gncs-ipv4-all"
    ]
    key_pair_name = "example-key-pair"
    instance_name = "example-instance"
    image_name    = "vmi-ubuntu-20.04-amd64-30gb"
    flavor_name   = "g-2gb"
    tag_name      = "example-instance"
  }
  description = "settings for a instance"
}

variable "host" {
  type = object({
    host_name                         = string # host name
    ssh_user_name                     = string # ssh user name for ssh connection from local to host
    ssh_user_password                 = string # ssh user password for ssh connection from local to host
    path_to_public_key                = string # path to public key in local
    path_to_private_key               = string # path to private key in local
    ssh_port                          = string # ssh port opened by host for using ssh connection.
    domain                            = string # domain name for host
    email                             = string # email for using ssl certifications.
    ssh_key_name_for_accessing_github = string # newly generated ssh key name to access githuub
    application_directory_name        = string # directory for placing the application 
    git_repository_name_for_cloning   = string # repository name to clone from github 
    github_access_token               = string # github personal access token with repo and admin: public_key scope
    path_to_certificates_directory    = string # path to certificates directory
  })
  default = {
    host_name                         = "example-instance"
    ssh_user_name                     = "example-user"
    ssh_user_password                 = "example-password"
    path_to_public_key                = "~/.ssh/example.pub"
    path_to_private_key               = "~/.ssh/example"
    ssh_port                          = "22"
    domain                            = "example.com"
    email                             = "example@example.com"
    ssh_key_name_for_accessing_github = "example"
    application_directory_name        = "example-app"
    git_repository_name_for_cloning   = "bmf-san/gobel-example"
    github_access_token               = "token1234"
    path_to_certificates_directory    = "/path/to/certificates"
  }
  description = "settings for a instance"
}