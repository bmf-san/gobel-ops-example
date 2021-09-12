#!/bin/bash

# cf. https://github.com/k2snow/letsencrypt-dns-conoha

SCRIPT_PATH=$(dirname $(readlink -f $0))
source ${SCRIPT_PATH}/conoha_id

get_conoha_token(){
  curl -sS https://identity.tyo2.conoha.io/v2.0/tokens \
  -X POST \
  -H "Accept: application/json" \
  -d '{ "auth": { "passwordCredentials": { "username": "'${CONOHA_API_USER_NAME}'", "password": "'${CONOHA_API_USER_PASSWORD}'" }, "tenantId": "'${CONOHA_TENANT_ID}'" } }' \
  | jq -r ".access.token.id"
}

get_conoha_domain_id(){
  curl -sS https://dns-service.tyo2.conoha.io/v1/domains \
  -X GET \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "X-Auth-Token: ${CONOHA_TOKEN}" \
  | jq -r '.domains[] | select(.name == "'${CONOHA_DNS_DOMAIN}'") | .id'
}

create_conoha_dns_record(){
  curl -sS https://dns-service.tyo2.conoha.io/v1/domains/${CONOHA_DOMAIN_ID}/records \
  -X POST \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "X-Auth-Token: ${CONOHA_TOKEN}" \
  -d '{ "name": "'${CONOHA_DNS_NAME}'", "type": "'${CONOHA_DNS_TYPE}'", "data": "'${CONOHA_DNS_DATA}'" }'
}

get_conoha_dns_record_id(){
  curl -sS https://dns-service.tyo2.conoha.io/v1/domains/${CONOHA_DOMAIN_ID}/records \
  -X GET \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "X-Auth-Token: ${CONOHA_TOKEN}" \
  | jq -r '.records[] | select(.name == "'${CONOHA_DNS_NAME}'" and .data == "'${CONOHA_DNS_DATA}'") | .id'
}

delete_conoha_dns_record(){
  local delete_id=$1
  curl -sS https://dns-service.tyo2.conoha.io/v1/domains/${CONOHA_DOMAIN_ID}/records/${delete_id} \
  -X DELETE \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "X-Auth-Token: ${CONOHA_TOKEN}"
}

CONOHA_TOKEN=$(get_conoha_token)
CONOHA_DOMAIN_ID=$(get_conoha_domain_id)
