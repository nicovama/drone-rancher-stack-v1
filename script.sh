#!/bin/sh

pytest test_healthcheck.tavern.yaml --elasticsearch_url=$ES_URL --logstash_url=$LOG2_URL --logstash_url=$LOG2_URL --kibana_url=$KIB_URL -vv

rc=$?
if [ $rc -ne 0 ]; then
/bin/rancher --url ${PLUGIN_URL} --access-key ${PLUGIN_ACCESSKEY} --secret-key ${PLUGIN_SECRETKEY} up --stack ${PLUGIN_STACK} --confirm-upgrade
else
echo "Rollback Rancher stack to previous configuration"
/bin/rancher --url ${PLUGIN_URL} --access-key ${PLUGIN_ACCESSKEY} --secret-key ${PLUGIN_SECRETKEY} up --stack ${PLUGIN_STACK} -d --rancher-file ${RANCHER_COMPOSE} --upgrade --rollback
fi
echo "Deployment complete"
