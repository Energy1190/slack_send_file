#!/usr/bin/env sh

URL=https://slack.com/api/files.upload
HOST=$(cat /tmp/hostname)
FILE=${SLACK_FILE}
TITLE=${SLACK_TITLE}
TOKEN=${SLACK_TOKEN}
CHANNEL=${SLACK_CHANNEL}

if [ -f "/tmp/hostname" ]; then
  HOST=$(cat /tmp/hostname)
else
  HOST="Unknown"
fi

if [ -z "${TITLE}" ]; then
  TITLE="Unknown"
fi

curl ${URL} -F channels="${CHANNEL}" -F token="${TOKEN}" -F title="${TITLE} from ${HOST}" -F filename="${TITLE}-${HOST}.log" -F file=@"${FILE}"
