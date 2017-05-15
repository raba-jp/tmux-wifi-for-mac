#!/usr/bin/env bash

source_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${source_path}/common.sh"

get_strength() {
	[ `is_mac_os` = 'false' ] && return 0

	case `get_state` in
		"running" )
			local signals=(▁ ▂ ▄ ▆ █)
			local signal=""
			local rssi=$(expr 5 - `get_rssi` / -20)
			for ((i=0; i < ${rssi}; i++ )); do
				signal="${signal}${signals[${i}]}"
			done
			echo "${signal}"
			;;
		"init" )
			echo "#[fg=yellow] ... #[default]"
			;;
		* )
			echo "#[fg=red] ✘  #[default]"
			;;
  esac
}

get_strength

unset source_path
