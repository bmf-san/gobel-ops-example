# gobel-ops-example
Gobel is a headless cms built with golang.

This is an example infrastructure configuration management for running [gobel-example](https://github.com/bmf-san/gobel-example) on the production environment on VPS by using terraform and ansible.

This sample code assumes the use of a Japanese VPS called conoha.

# gobel
- [bmf-tech-client](https://github.com/bmf-san/bmf-tech-client)
- [gobel-api](https://github.com/bmf-san/gobel-api)
- [gobel-client-example](https://github.com/bmf-san/gobel-client-example)
- [gobel-admin-client-example](https://github.com/bmf-san/gobel-admin-client-example)
- [gobel-example](https://github.com/bmf-san/gobel-example)
- [gobel-ops-example](https://github.com/bmf-san/gobel-ops-example)
- [migrate-rubel-to-gobel](https://github.com/bmf-san/migrate-rubel-to-gobel)

# Get started
Assuming execution from the local environment.

Need to install the following tools:
- terraform
- ansible
- ansible-lint


## Setup infrastructure by terraform
Create a terraform.tfvars.
See variables.tf for the variables you need to set.

```sh
cd terraform/
make apply
```

## Provisioning by ansible
To perform a DNS-01 challenge with letsencrypt with certificate acquisition, you need to set dns before running provision.

Please set the A record to the domain.

It is OK if the A record is returned by executing the dig command.

```
dig DOMAIN_NAME
```

```sh
cd ansible/
make init-provision
make provision
```

## Deploy
```sh
cd /deploy
cp .env.example .env # see a host file in /ansible/inventories/host_vars and edit an .env.
make deploy
```

# License
This project is licensed under the terms of the MIT license.

# Author
bmf - Software engineer.

- [github - bmf-san/bmf-san](https://github.com/bmf-san/bmf-san)
- [twitter - @bmf-san](https://twitter.com/bmf_san)
- [blog - bmf-tech](http://bmf-tech.com/)
