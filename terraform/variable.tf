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

variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}


variable "master_node" {
    type = object({
        keypair_name = string
        instance_name = string
        image_name = string
        flavor_name = string
        tag_name = string
        host_name = string
        new_user_name = string
        new_user_password = string
        path_to_public_key = string
        path_to_private_key = string
        ssh_port = string
    })
    default = {
        keypair_name = "example-keypair"
        instance_name = "example-instance"
        image_name = "vmi-ubuntu-20.04-amd64-30gb"
        flavor_name = "g-2gb"
        tag_name = "example-master"
        host_name = "master"
        new_user_name = "example-user"
        new_user_password = "example-password"
        path_to_public_key = "~/.ssh/example.pub"
        path_to_private_key = "~/.ssh/example"
        ssh_port = "22"
    }
    description = "settings for master node"
}

variable "worker_nodes" {
    type = list(object({
        keypair_name = string
        instance_name = string
        image_name = string
        flavor_name = string
        tag_name = string
        host_name = string
        new_user_name = string
        new_user_password = string
        path_to_public_key = string
        path_to_private_key = string
        ssh_port = string
    }))
    default = [
        {
            keypair_name = "example-keypair"
            instance_name = "example-instance"
            image_name = "vmi-ubuntu-20.04-amd64-30gb"
            flavor_name = "g-2gb"
            tag_name = "example-worker"
            host_name = "worker"
            new_user_name = "example-user"
            new_user_password = "example-password"
            path_to_public_key = "~/.ssh/example.pub"
            path_to_private_key = "~/.ssh/example"
            ssh_port = "22"
        }
    ]
    description = "settings for worker nodes"
}