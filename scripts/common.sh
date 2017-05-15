#!/usr/bin/env bash

is_mac_os() {
	[ $(uname) = 'Darwin' ] && echo 'true' || echo 'false'
}

get_airport_path() {
	echo "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
}

get_airport_info() {
	local path=`get_airport_path`
	echo "$(eval "${path}" --getinfo | grep -E "^ *(agrCtlRSSI|state|lastTxRate|SSID):" | awk '{print $2}')"
}

get_rssi() {
	local info=(`get_airport_info`)
	echo ${info[0]}
}

get_state() {
	local info=(`get_airport_info`)
	echo ${info[1]}
}
