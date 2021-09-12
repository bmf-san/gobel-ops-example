#!/bin/bash

# cf. https://github.com/k2snow/letsencrypt-dns-conoha

SCRIPT_NAME=$(basename $0)
SCRIPT_PATH=$(dirname $(readlink -f $0))

CONOHA_DNS_DOMAIN=${CERTBOT_DOMAIN}'.'
CONOHA_DNS_NAME='_acme-challenge.'${CONOHA_DNS_DOMAIN}
CONOHA_DNS_TYPE="TXT"
CONOHA_DNS_DATA=${CERTBOT_VALIDATION}

source ${SCRIPT_PATH}/conoha_dns_api.sh

CONOHA_RECORD_ID=$(get_conoha_dns_record_id)

delete_conoha_dns_record ${CONOHA_RECORD_ID};

# NOTE: It seems that it is necessary to wait for the TXT record to be reflected, so sleep.
sleep 30