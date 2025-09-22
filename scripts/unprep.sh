#!/bin/bash

set -euo pipefail

if [ "${DEBUG:-0}" = 1 ]; then
    set -x
fi

export MYSQL_IMAGE="${MYSQL_IMAGE:-mysql}"
export MYSQL_VERSION="${MYSQL_VERSION:-8.4}"
export MYSQL_CERTS_DIR='/etc/mysql_certs'

BASEDIR="./scripts"

docker compose -f "${BASEDIR}"/docker-compose.yml down --volumes

sudo rm -rf "${BASEDIR}/run" "${BASEDIR}/certs" "${BASEDIR}/my-ssl.cnf"
