#!/bin/sh
echo "Deploying Rancher Stack with force upgrade"
echo "${PLUGIN_URL} ${PLUGIN_ACCESSKEY} ${PLUGIN_SECRETKEY} ${PLUGIN_STACK}"
/bin/rancher --url ${PLUGIN_URL} --access-key ${PLUGIN_ACCESSKEY} --secret-key ${PLUGIN_SECRETKEY} up --stack ${PLUGIN_STACK} -d -f ${DOCKER_COMPOSE} --rancher-file ${RANCHER_COMPOSE} --pull --force-recreate --confirm-upgrade
