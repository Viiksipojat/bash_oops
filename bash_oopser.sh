#!/bin/bash

BASH_OOPS_RC="$HOME/.bash_oops.rc"
source "$BASH_OOPS_RC" # apikeys & tokens

# bashoauth depends on md5sum, but macosx provides md5
command -v md5sum >/dev/null 2>&1 || alias md5sum='md5 -r'
has_imagesnap=$(command -v imagesnap >/dev/null 2>&1)$?

source $(which TwitterOAuth.sh)
TO_init

if [[ "$oauth_token" == "" ]] || [[ "$oauth_token_secret" == "" ]]; then
	TO_access_token_helper
	if (( $? == 0 )); then
		oauth_token=${TO_ret[0]}
		oauth_token_secret=${TO_ret[1]}
		echo "oauth_token='${TO_ret[0]}'" >> "$BASH_OOPS_RC"
		echo "oauth_token_secret='${TO_ret[1]}'" >> "$BASH_OOPS_RC"
	else
		echo 'bash_oops failed to get twitter access token'
	fi
fi

tweet_ur_failure() {
	failure=$1
	[ ${#failure} -gt 140 ] && failure=${failure:0:139}…

	if [ $has_imagesnap ]; then	
		failface=$(mktemp -t 'bash_oops').jpg
		imagesnap -q $failface

		# TODO: use image

		( TO_statuses_update "$failure" & )
	else
		( TO_statuses_update "$failure" & )
	fi
}
trap 'tweet_ur_failure "$BASH_COMMAND"' ERR