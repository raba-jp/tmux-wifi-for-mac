#!/usr/bin/env bash

source_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${source_path}/scripts/helpers.sh"

do_interpolation() {
	local string="$1"
	local interpolation_ssid_string="\#{wifi_ssid_mac}"
	local interpolation_rate_string="\#{wifi_rate_mac}"
	local interpolation_strength_string="\#{wifi_strength_mac}"

	local ssid_string="#(${source_path}/scripts/ssid.sh)"
	local rate_string="#(${source_path}/scripts/rate.sh)"
	local strength_string="#(${source_path}/scripts/strength.sh)"

	local string="${string/${interpolation_ssid_string}/${ssid_string}}"
	local string="${string/${interpolation_rate_string}/${rate_string}}"
	local string="${string/${interpolation_strength_string}/${strength_string}}"

	printf %s "${string}"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}

main

unset source_path
