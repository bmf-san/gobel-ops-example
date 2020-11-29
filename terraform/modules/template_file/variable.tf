variable "new_user_name" {
    type = string
    default = "new_user_name"
    description = "new user name for a node"
}

variable "new_user_password" {
    type = string
    default = "new_user_password"
    description = "new user password for a node"
}

variable "public_key" {
    type = string
    default = "public_key"
    description = "public key for a node"
}

variable "ssh_port" {
    type = string
    default = "ssh_port"
    description = "ssh port for a node"
}

variable "host_name" {
    type = string
    default = "host_name"
    description = "host name for a node"
}