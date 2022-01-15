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

variable "path_to_public_key" {
  type        = string
  default     = "path_to_public_key"
  description = "path to public key for a node"
}