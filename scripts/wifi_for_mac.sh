#!/usr/bin/env bash

is_mac_os() {
	[ $(uname) = 'Darwin' ] && echo 'true' || echo 'false'
}

get_airport_path() {
	echo "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
}

get_airport_info() {
	local path=`get_airport_path`
	echo "$(eval "${path}" -I | grep -E "^ *(agrCtlRSSI|state|SSID):" | awk '{print $2}')"
}

get_rssi() {
	local info=(`get_airport_info`)
	echo ${info[0]}
}

get_state() {
	local info=(`get_airport_info`)
	echo ${info[1]}
}

get_ssid() {
	local info=(`get_airport_info`)
	echo ${info[2]}
}

get_airport_value() {
	[ `is_mac_os` = 'false' ] && return 0

	case "`get_state`" in
		"running" )
			local signals=(▁ ▂ ▄ ▆ █)
			local signal=""
			local rssi=$(expr 5 - `get_rssi` / -20)
			for ((i=0; i <${rssi}; i++ )); do
				local signal="${signal}${signals[${i}]}"
			done
			echo "#[underscore]`get_ssid`#[default] | ${signal}"
			;;
		"init" )
			echo "#[fg=yellow] ... "
			;;
		* )
			"#[fg=red] ✘ "
			;;
	esac
}

get_wifi_status() {
	echo "#[bold]|#[default]`get_airport_value`#[bold]#[fg=colour014]|#[default]"
}

get_wifi_status
