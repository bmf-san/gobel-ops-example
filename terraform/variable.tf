variable "user_name" {
    type = string
    default = "user1234"
    description = "API user name"
}

variable "password" {
    type = string
    default = "password1234"
    description = "API user password"
}

variable "tenant_name" {
    type = string
    default = "tenant1234"
    description = "tenant name"
}

variable "auth_url" {
    type = string
    default = "https://identity.tyo2.conoha.io/v2.0"
    description = "endpoint of api for authentication"
}

variable "master_keypair_name" {
    type = string
    default = "master_keypair"
    description = "keypair name for a master node"
}

variable "master_instance_name" {
    type = string
    default = "master_instance_name"
    description = "instance name for a master node"
}

variable "master_image_name" {
    type = string
    default = "master_image_name"
    description = "image name for a master node"
}

variable "master_flavor_name" {
    type = string
    default = "master_flavor_name"
    description = "flavor name for a master node"
}

variable "master_tag_name" {
    type = string
    default = "master_tag_name"
    description = "tag name for a master node"
}

variable "master_host_name" {
    type = string
    default = "master_host_name"
    description = "host name for a master node"
}

variable "master_new_user_name" {
    type = string
    default = "master_new_user_name"
    description = "new user name for a master node"
}

variable "master_new_user_password" {
    type = string
    default = "master_new_user_password"
    description = "new user password for a master node"
}

variable "master_path_to_public_key" {
    type = string
    default = "master_path_to_public_key"
    description = "path to public key for a master node"
}

variable "master_path_to_private_key" {
    type = string
    default = "master_path_to_private_key"
    description = "path to private key for a master node"
}

variable "master_ssh_port" {
    type = string
    default = "master_ssh_port"
    description = "ssh port for a master node"
}
