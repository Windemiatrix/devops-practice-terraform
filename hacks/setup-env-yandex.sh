#!/bin/bash

cloud_id=b1gmttedcb1ksiis7dg4
folder_id=b1gvsp3ff1a1is4a8t6g
terraform_state_keys_secret_id=e6q8f31urha36u6r0923

yc init --cloud-id=${cloud_id} --folder-id=${folder_id}

IAM_TOKEN=$(yc iam create-token)

cat <<EOF >>./.env
YC_STORAGE_ACCESS_KEY=$(curl -X GET -s \
    -H "Authorization: Bearer ${IAM_TOKEN}" \
    https://payload.lockbox.api.cloud.yandex.net/lockbox/v1/secrets/${terraform_state_keys_secret_id}/payload | jq -r .entries[0].textValue)
YC_STORAGE_SECRET_KEY=$(curl -X GET -s \
        -H "Authorization: Bearer ${IAM_TOKEN}" \
        https://payload.lockbox.api.cloud.yandex.net/lockbox/v1/secrets/${terraform_state_keys_secret_id}/payload | jq -r .entries[1].textValue)
YC_CLOUD_ID=${cloud_id}
YC_FOLDER_ID=${folder_id}
YC_TOKEN=${IAM_TOKEN}
EOF
