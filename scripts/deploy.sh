#!/bin/sh

eval $(ssh-agent)
for key in $SSH_ID_RSA_PUBLIC $SSH_ID_RSA_VALIDATOR; do
    chmod 600 "$key"
    ssh-add "$key"
done

yarn

if [ ! -z "${CONFIG_FILE}" ]; then
    yarn sync -c "${CONFIG_FILE}"
else
    yarn sync
fi
