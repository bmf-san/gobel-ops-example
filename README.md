# gobel-ops-example
Gobel is a headless cms built with golang.

This is an example infrastructure configuration management for running [gobel-example](https://github.com/bmf-san/gobel-example) on the production environment on VPS by using terraform and ansible.

This sample code assumes the use of a Japanese VPS called conoha.

I'm assuming deploying an application using docker-context.

See [gobel-example](https://github.com/bmf-san/gobel-example) for deploying the application.

# gobel
- [gobel-api](https://github.com/bmf-san/gobel-api)
- [gobel-client-example-example](https://github.com/bmf-san/gobel-client-example-example)
- [gobel-admin-client-example](https://github.com/bmf-san/gobel-admin-client-example)
- [gobel-example](https://github.com/bmf-san/gobel-example)
- [gobel-ops-example](https://github.com/bmf-san/gobel-ops-example)

# Get started
## Setup infrastructure by terraform
Create a terraform.tfvars

```sh
cd terraform/
make apply
```

## Provisioning by ansible
```sh
cd ansible/
make init-provision
```

```sh
make provision
```

## Deploy
```sh
cd /deploy
cp .env.example .env
make deploy
```

# License
This project is licensed under the terms of the MIT license.

# Author
bmf - Software engineer.

- [github - bmf-san/bmf-san](https://github.com/bmf-san/bmf-san)
- [twitter - @bmf-san](https://twitter.com/bmf_san)
- [blog - bmf-tech](http://bmf-tech.com/)