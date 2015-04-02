#!/bin/bash
REPO_DIR=$(git rev-parse --show-toplevel)
source "$REPO_DIR/config/slack_settings"
team=$SLACK_TEAM
if [[ $team == "" ]]
then
        echo "No slack team in environment"
        exit 1
fi
token=$SLACK_TOKEN
if [[ $token == "" ]]
then
        echo "No token in environment"
        exit 1
fi
shift
channel=$SLACK_DEV_CHANNEL
if [[ $channel == "" ]]
then
        echo "No dev channel in environment"
        exit 1
fi
shift
repo_name=`git config --get remote.origin.url`
repo_name=${repo_name#*com:}
repo_name=${repo_name%.git}
branch=`git symbolic-ref HEAD`
branch=${branch#*heads\/}
branch_type=${branch%/*}
user=`git config user.name`
text="@group: $user finished $branch for $repo_name"
escapedText=$(echo $text | sed 's/"/\"/g' | sed "s/'/\'/g" )
json="{\"channel\": \"#$channel\", \"text\": \"$escapedText\", \"link_names\": 1, \"username\":\"Git Flow\"}"
curl -s -d "payload=$json" "https://$team.slack.com/services/hooks/incoming-webhook?token=$token"
