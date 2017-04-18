#!/usr/bin/env bash
export API_KEY=$1
       SECRET_KEY=$2
       PROJECT_ID=$3
       SOUCE_FILE_NAME=$4
       SAVE_FILE_PATH=$5

JSON_TOOL_VERSION=$(npm list --depth 1 --global jsontool)
if [[ "$JSON_TOOL_VERSION" == *"empty"* ]]; then
     echo "Install jsontool"
     npm i -g jsontool
fi

CURRENT_SECOND=$(date +%s)
DEV_STRING=$CURRENT_SECOND$SECRET_KEY

MD5_HTML=$(curl -H 'Host: www.md5.cz' -H 'Content-type: application/x-www-form-urlencoded' --data-binary "what=$DEV_STRING" --compressed 'http://www.md5.cz/getmd5.php')
DEV_HASH=$(echo $MD5_HTML | awk -F "|" '{print $1}')

URL="https://platform.api.onesky.io/1/projects/"$PROJECT_ID"/translations/multilingual?api_key="$API_KEY"&dev_hash="$DEV_HASH"&timestamp="$CURRENT_SECOND"&source_file_name="$SOUCE_FILE_NAME"&file_format=I18NEXT_MULTILINGUAL_JSON"

content=$(curl -H "Host: platform.api.onesky.io" $URL)

cd ../../
save_path="`pwd`/$SAVE_FILE_PATH"

echo $(node -pe 'JSON.stringify(JSON.parse(process.argv[1])["id"], null, 4)' "$content") | json > $save_path"/id.json"
echo $(node -pe 'JSON.stringify(JSON.parse(process.argv[1])["en-US"], null, 4)' "$content") | json > $save_path"/english.json"