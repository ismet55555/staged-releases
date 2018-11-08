#!/usr/bin/env bash
## This script sets the fleet wide commit hash to a specified value as arg $2 for app ID specified as arg $1.
## It is usually used after one has disabled rolling releases and allows one
## to set an entire fleet to any specific build in their list of builds for an App.

./check-configuration.sh || exit 1

source ./resin.env
APP_ID=$1
COMMIT_HASH=$2
echo "setting APP: $APP_ID to COMMIT == $COMMIT_HASH"
curl -X PATCH "https://api.$BASE_URL/v4/application($APP_ID)" -H "Authorization: Bearer $authToken" -H "Content-Type: application/json" --data-binary '{"commit":"'$COMMIT_HASH'"}'
