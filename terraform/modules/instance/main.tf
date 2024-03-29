terraform {
  required_version = "1.0.8"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.35.0"
    }
  }
}

resource "openstack_compute_keypair_v2" "gobel_keypair" {
  name       = (var.instance.key_pair_name)
  public_key = file(var.path_to_public_key)
}

resource "openstack_compute_instance_v2" "gobel_instance" {
  name            = (var.instance.instance_name)
  image_name      = (var.instance.image_name)
  flavor_name     = (var.instance.flavor_name)
  key_pair        = (var.instance.key_pair_name)
  security_groups = (var.instance.security_groups)

  metadata = {
    instance_name_tag = (var.instance.tag_name)
  }
}
