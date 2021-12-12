#!/bin/bash

# cf. https://github.com/k2snow/letsencrypt-dns-conoha

SCRIPT_NAME=$(basename $0)
SCRIPT_PATH=$(dirname $(readlink -f $0))

CONOHA_DNS_DOMAIN=${CERTBOT_DOMAIN}'.'
CONOHA_DNS_NAME='_acme-challenge.'${CONOHA_DNS_DOMAIN}
CONOHA_DNS_TYPE="TXT"
CONOHA_DNS_DATA=${CERTBOT_VALIDATION}

source ${SCRIPT_PATH}/conoha_dns_api.sh

create_conoha_dns_record

# NOTE: It seems that it is necessary to wait for the TXT record to be reflected, so sleep.
sleep 30