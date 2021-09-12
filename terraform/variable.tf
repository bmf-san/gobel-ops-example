variable "user_name" {
  type        = string
  default     = "user1234"
  description = "API user name"
}

variable "password" {
  type        = string
  default     = "password1234"
  description = "API user password"
}

variable "tenant_name" {
  type        = string
  default     = "tenant1234"
  description = "tenant name"
}

variable "security_groups" {
  type = list(any)
  default = [
    "gncs-ipv4-all"
  ]
  description = "security groups for instance"
}

variable "auth_url" {
  type        = string
  default     = "https://identity.tyo2.conoha.io/v2.0"
  description = "endpoint of api for authentication"
}

variable "instance" {
  type = object({
    key_pair_name       = string
    instance_name       = string
    image_name          = string
    flavor_name         = string
    tag_name            = string
    host_name           = string
    new_user_name       = string
    new_user_password   = string
    path_to_public_key  = string
    path_to_private_key = string
    ssh_port            = string
    domain              = string
    email               = string
  })
  default = {
    key_pair_name       = "example-key-pair"
    instance_name       = "example-instance"
    image_name          = "vmi-ubuntu-20.04-amd64-30gb"
    flavor_name         = "g-2gb"
    tag_name            = "example-instance"
    host_name           = "example-instance"
    new_user_name       = "example-user"
    new_user_password   = "example-password"
    path_to_public_key  = "~/.ssh/example.pub"
    path_to_private_key = "~/.ssh/example"
    ssh_port            = "22"
    domain              = "example.com"
    email               = "example@example.com"
  }
  description = "settings for a instance"
}