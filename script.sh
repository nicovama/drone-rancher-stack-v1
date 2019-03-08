#!/bin/sh
if [[ -n $PLUGIN_ACCESSKEY ]]; then
    ACCESSKEY="$PLUGIN_ACCESSKEY"
fi
if [[ -n $RANCHER_ACCESSKEY ]]; then
    ACCESSKEY="$RANCHER_ACCESSKEY"
fi
if [[ -n $PLUGIN_SECRETKEY ]]; then
    SECRETKEY="$PLUGIN_SECRETKEY"
fi
if [[ -n $RANCHER_SECRETKEY ]]; then
    SECRETKEY="$RANCHER_SECRETKEY"
fi
echo "Rollback Rancher stack to previous configuration"
/bin/rancher --url ${PLUGIN_URL} --access-key ${PLUGIN_ACCESSKEY} --secret-key ${PLUGIN_SECRETKEY} up --stack ${PLUGIN_STACK} -d -r
