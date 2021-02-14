# gobel-ops-example
Gobel is a headless cms built with golang.

This is an example infrastructure configuration management for running [gobel-example](https://github.com/bmf-san/gobel-example) on ConoHa vps.

# gobel
- [gobel-api](https://github.com/bmf-san/gobel-api)
- [gobel-client-example-example](https://github.com/bmf-san/gobel-client-example-example)
- [gobel-admin-client-example](https://github.com/bmf-san/gobel-admin-client-example)
- [gobel-example](https://github.com/bmf-san/gobel-example)
- [gobel-ops-example](https://github.com/bmf-san/gobel-ops-example)

# Features
- Terraform
- Ansible
- OpenStack
- Kubernetes

# Get started
## Generate a ssh key
Before you start, generate keys for each node user.

ex.
`ssh-keygen -t rsa`

## Setup tfvars
Copy example.tfvars with any name you like, and edit it like this.

ex.
```sh
user_name="user-name"
password="password"
tenant_name="tenant-name"
auth_url="https://identity.tyo2.conoha.io/v2.0"
master_keypair_name="keypair-name"
master_instance_name="instance-name"
master_image_name="vmi-ubuntu-20.04-amd64-30gb"
master_flavor_name="g-2gb"
master_tag_name="tag-name"
master_host_name="host-name"
master_new_user_name="user-name"
master_new_user_password="password1234"
master_path_to_public_key="~/.ssh/publickey.pub"
master_path_to_private_key="~/.ssh/privatekey"
master_ssh_port="22"
```

If you give tfvars file a name other than terraform.tfvars, you need to use option when executing a command. terraform COMMAND -var-file anyname.tfvars

If you name it terraform.tfvars, you do not need to specify -var-file option.

## Set up instances by terraform
```sh
cd terraform/
make init
make apply
```

If you want to delete the instance, run the following command.

```sh
cd terraform/
make destroy
```

## Provisioning by ansible
Execute after the instance creation is completed.

```sh
cd ansible/
make init-provision
```

## Check ssh connection
`ssh username@ipaddress -i path_to_private_key`

## Deploy
// TODO: k8s deployment

# Reference
- [chidakiyo.hatenablog.com - Kubernetes NodePort vs LoadBalancer vs Ingress? When should I use what? (Kubernetes NodePort と LoadBalancer と Ingress のどれを使うべきか) を訳した](https://chidakiyo.hatenablog.com/entry/2018/09/10/Kubernetes_NodePort_vs_LoadBalancer_vs_Ingress%3F_When_should_I_use_what%3F_(Kubernetes_NodePort_%E3%81%A8_LoadBalancer_%E3%81%A8_Ingress_%E3%81%AE%E3%81%A9%E3%82%8C%E3%82%92%E4%BD%BF%E3%81%86)
- [medium.com - On-premises Kubernetes pitfalls](https://medium.com/makotows-blog/on-premise-kubernetes-pitfalls-2aa49e1a4c2c)
- [metallb](https://metallb.universe.tf/)
- [MetalLB入門 ― オンプレKubernetesクラスタでLoadBalancerタイプのServiceを使う](https://www.kaitoy.xyz/2020/10/31/metallb/)
- [blog.web-apps.tech - MetalLBを使用してオンプレでもtype: LoadBalancerを使用する](https://blog.web-apps.tech/type-loadbalancer_by_metallb/)
- [computingforgeeks.com - Install Kubernetes Cluster on Ubuntu 20.04 with kubeadm](https://computingforgeeks.com/deploy-kubernetes-cluster-on-ubuntu-with-kubeadm/)
- [snowsystem.net - Ubuntu 20.04LTSにkubernetes環境をkubeadmで構築する手順](https://snowsystem.net/container/kubernetes/kubernetes-build-env/)
- [k0kubun.hatenablog.com - 個人で運用するKubernetesクラスタ](https://k0kubun.hatenablog.com/entry/kubernetes)
- [gist.github.com - san-tak/tf-bookmark.md](https://gist.github.com/san-tak/9ef4d15eafb4c8a42af33ffa04464739)
- [blog.mosuke.tech](https://blog.mosuke.tech/entry/2019/03/26/terraform-integrated-with-ansible/)
- [www.redhat.com - HASHICORP TERRAFORM AND RED HAT ANSIBLE AUTOMATION](https://www.redhat.com/cms/managed-files/pa-terraform-and-ansible-overview-f14774wg-201811-en.pdf)
- [note.com - AnsibleとTerraformと](https://note.com/santak/n/n22dbb35f6c01)
- [booth.pm - Phases of kubeadm 2nd Edition](https://booth.pm/ja/items/1730081)
- [conoha.jp - ConoHa API Documentation](https://www.conoha.jp/docs/)
- [registry.terraform.io - openstack_compute_keypair_v2](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_keypair_v2)
- [registry.terraform.io - openstack_compute_instance_v2](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2)
- [qiita.com - 【Ubuntu 18.04】Ansible で Docker と docker-compose をインストールする](https://qiita.com/yukin01/items/dd1cfc07abefd6a13aa5)
- [qiita.com - TerraformでConoHaのインスタンスを立ててみる](https://qiita.com/kaminchu/items/d0776c381213d54a3a69)
- [qiita.com - TerraformからAnsibleのplaybookを実行する](https://qiita.com/hayaosato/items/ee0d6eabb7b3d0a22136)
- [blog.adachin.me - [OpenStack]TerraformでConoHa VPSのインスタンスを立ち上げてみた！](https://blog.adachin.me/archives/10378)
- [github.com - maki0922/terraform_in_conoha](https://github.com/maki0922/terraform_in_conoha)
- [github.com - hobbby-kube](https://github.com/hobby-kube/provisioning)
- [github.com - r0b2g1t/terraform-openstack-ansible](https://github.com/r0b2g1t/terraform-openstack-ansible)
- [github.com - dan4ex/Terraform](https://github.com/dan4ex/Terraform)
- [github.com - kubernetes-digitalocean-terraform/kubernetes-digitalocean-terraform](https://github.com/kubernetes-digitalocean-terraform/kubernetes-digitalocean-terraform)

# License
This project is licensed under the terms of the MIT license.