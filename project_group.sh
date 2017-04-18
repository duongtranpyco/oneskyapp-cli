#!/usr/bin/env bash
export API_KEY=$1
       SECRET_KEY=$2

CURRENT_SECOND=$(date +%s)
DEV_STRING=$CURRENT_SECOND$SECRET_KEY

MD5_HTML=$(curl -H 'Host: www.md5.cz' -H 'Content-type: application/x-www-form-urlencoded' --data-binary "what=$DEV_STRING" --compressed 'http://www.md5.cz/getmd5.php')
DEV_HASH=$(echo $MD5_HTML | awk -F "|" '{print $1}')

PROJECT_GROUPS_URL="https://platform.api.onesky.io/2/project-groups?api_key="$API_KEY"&dev_hash="$DEV_HASH"&timestamp="$CURRENT_SECOND
curl -H "Host: platform.api.onesky.io" $PROJECT_GROUPS_URL