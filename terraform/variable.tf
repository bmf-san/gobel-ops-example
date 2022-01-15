variable "conoha" {
  type = object({
    user_name                 = string
    password                  = string
    tenant_name               = string
    tenant_id                 = string
    identity_service_endpoint = string
    region                    = string
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
    security_groups = list(any)
    key_pair_name   = string
    instance_name   = string
    image_name      = string
    flavor_name     = string
    tag_name        = string
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
    host_name                         = string
    ssh_user_name                     = string
    ssh_user_password                 = string
    path_to_public_key                = string
    path_to_private_key               = string
    ssh_port                          = string
    domain                            = string
    email                             = string
    ssh_key_name_for_accessing_github = string
    application_directory_name        = string
    git_repository_name_for_cloning   = string
    github_access_token               = string
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
  }
  description = "settings for a instance"
}