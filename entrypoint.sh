#!/bin/sh -l

CREATED_AT=$(date -u "+%Y-%m-%dT%H:%M:%S""+00:00")
CULTURE="en_EN"
VERSION="1.0.0"
VENTURE_REFERENCE=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 48 | head -n 1)

VENTURE_CONFIG_ID="${1}"
USERNAME="${2}"
PASSWORD="${3}"
BUS_BASE_URL="${4}"
EVENT_NAME="${5}"
PAYLOAD="${6}"

EVENT=$(cat <<EOF
{"event": "${EVENT_NAME}", "venture_config_id": "${VENTURE_CONFIG_ID}", "venture_reference": "${VENTURE_REFERENCE}", "created_at": "${CREATED_AT}", "culture": "${CULTURE}", "version": "${VERSION}", "payload": ${PAYLOAD}}
EOF
)

printf "${EVENT}\n"

#printf "${EVENT}\n" | rsb-cli \
#  --username ${USERNAME} \
#  --password ${PASSWORD} \
#  --venture-config-id ${VENTURE_CONFIG_ID} \
#  --bus-base-url ${BUS_BASE_URL} \
#  --event ${EVENT_NAME}

printf "::set-output name=event::${EVENT}"
