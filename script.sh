#!/bin/sh
fi
echo "rancher-compose.yml @ ${RANCHER_COMPOSE}" 
cat ${RANCHER_COMPOSE}
echo ""
echo "docker-compose.yml @ ${DOCKER_COMPOSE}"
cat ${DOCKER_COMPOSE}
echo ""
echo ${ACCESSKEY}
echo ${SECRETKEY}
echo ${PLUGIN_URL}
echo "Deploying Rancher Stack with force upgrade"
echo "${PLUGIN_URL} ${PLUGIN_ACCESSKEY} ${PLUGIN_SECRETKEY} ${PLUGIN_STACK}"
/bin/rancher --url ${PLUGIN_URL} --access-key ${PLUGIN_ACCESSKEY} --secret-key ${PLUGIN_SECRETKEY} up --stack ${PLUGIN_STACK} -d -f ${DOCKER_COMPOSE} --rancher-file ${RANCHER_COMPOSE} --pull --force-recreate
sleep 2m
echo "Deploying Load Balancer"
/bin/rancher --url ${PLUGIN_URL} --access-key ${PLUGIN_ACCESSKEY} --secret-key ${PLUGIN_SECRETKEY} up --stack ${PLUGIN_STACK} -d -f ${DOCKER_COMPOSE_LB} --rancher-file ${RANCHER_COMPOSE_LB} --pull --force-recreate
