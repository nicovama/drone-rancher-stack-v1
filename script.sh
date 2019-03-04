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
echo ""
echo ${ACCESSKEY}
echo ${SECRETKEY}
echo ${PLUGIN_URL}
echo "Stoping the Stack"
echo "${PLUGIN_URL} ${PLUGIN_ACCESSKEY} ${PLUGIN_SECRETKEY} ${PLUGIN_STACK}"
/bin/rancher --url ${PLUGIN_URL} --access-key ${PLUGIN_ACCESSKEY} --secret-key ${PLUGIN_SECRETKEY} stop --type ${PLUGIN_STACK} 
