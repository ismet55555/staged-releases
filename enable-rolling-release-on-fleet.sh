#!/usr/bin/env bash
# This reverses the action in ./disable-rolling-release-on-fleet.sh
# and causes all the devices to again start tracking the latest build.
# Note that you will need to either set the Application Commit to the latest using ./set-fleet-commit-hash.sh
# or do another git push and the devices will update to that new build.
## usage: ./enable-rolling-release-on-fleet.sh <APP_ID>

./check-configuration.sh || exit 1

source ./resin.env
APP_ID=$1

echo "enabling rolling release tracking for APP == $APP_ID"
curl -X PATCH "https://api.$BASE_URL/v4/application($APP_ID)" -H "Authorization: Bearer $authToken" -H "Content-Type: application/json" --data-binary '{"should_track_latest_release":true}'

curl "https://api.$BASE_URL/v4/application($APP_ID)" -H "Authorization: Bearer $authToken" -H "Content-Type: application/json" | jq .
