#!/usr/bin/env bash

source_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${source_path}/common.sh"

get_rate() {
	[ `is_mac_os` = 'false'] && return 0

	local info=(`get_airport_info`)
	echo "${info[2]}Mbs"
}

get_rate

unset source_path
