provider "openstack" {
  user_name   = (var.conoha.user_name)
  password    = (var.conoha.password)
  tenant_name = (var.conoha.tenant_name)
  auth_url    = (var.conoha.identity_service_endpoint)
}