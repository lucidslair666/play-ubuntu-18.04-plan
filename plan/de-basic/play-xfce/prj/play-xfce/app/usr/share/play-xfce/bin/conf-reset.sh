#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source "$THE_BASE_DIR_PATH/_init.sh"


## func

### Head: util #################################################################
#

run_conf_reset_each () {
	local file_name
	local source_file_path
	local target_file_path
	local source_dir_path="$1"
	shift 1
	local target_dir_path="$1"
	shift 1
	for file_name in $@; do
		source_file_path="$source_dir_path/$file_name"
		target_file_path="$target_dir_path/$file_name"

		if [ -f "$source_file_path" ]; then
			cp "$source_file_path" "$target_file_path"
			echo cp "$source_file_path" "$target_file_path"
		fi

	done
}
#
### Tail: util #################################################################


### Head: xfce4 ################################################################
#
run_xfce4_conf_reset_each () {
	run_conf_reset_each "$THE_XFCE4_XFCONF_XFCE_PERCHANNEL_CONF_RESET_DIR_PATH" "$THE_XFCE4_XFCONF_XFCE_PERCHANNEL_CONF_MAIN_DIR_PATH" "$@"
}

run_xfce4_conf_reset () {
	#local file_list="xfce4-keyboard-shortcuts.xml xfwm4.xml"
	local file_list=""

	run_xfce4_conf_reset_each "$file_list"

}
#
### Tail: xfce4 #################################################################


### Head: rofi #################################################################
#
run_rofi_conf_reset_each () {
	run_conf_reset_each "$THE_ROFI_CONF_RESET_DIR_PATH" "$THE_ROFI_CONF_MAIN_DIR_PATH" "$@"
}

run_rofi_conf_reset () {
	local file_list="config"

	run_rofi_conf_reset_each "$file_list"

}
#
### Tail: rofi #################################################################


### Head: fcitx ################################################################
#
run_fcitx_conf_set_im_config () {
	im-config -n fcitx
	## cat ~/.xinputrc
}

run_fcitx_conf_set_each () {
	run_conf_set_each "$THE_FCITX_CONF_SET_DIR_PATH" "$THE_FCITX_CONF_MAIN_DIR_PATH" "$@"
}

run_fcitx_conf_set () {
	local file_list="profile"

	run_fcitx_conf_set_each "$file_list"

	run_fcitx_conf_set_im_config
}
#
### Tail: fcitx ################################################################


### Head: gtk3 #################################################################
#
run_gtk3_conf_reset_each () {
	run_conf_reset_each "$THE_GTK3_CONF_RESET_DIR_PATH" "$THE_GTK3_CONF_MAIN_DIR_PATH" "$@"
}

run_gtk3_conf_reset () {
	local file_list="settings.ini"

	run_gtk3_conf_reset_each "$file_list"

}
#
### Tail: gtk3 #################################################################


### Head: gtk2 #################################################################
#
run_gtk2_conf_reset_each () {
	run_conf_reset_each "$THE_GTK2_CONF_RESET_DIR_PATH" "$THE_GTK2_CONF_MAIN_DIR_PATH" "$@"
}

run_gtk2_conf_reset () {
	local file_list=".gtkrc-2.0"

	run_gtk2_conf_reset_each "$file_list"

}
#
### Tail: gtk2 #################################################################


### Head: main #################################################################
#
main_conf_reset () {
	xdg_dir_prepare

	run_xfce4_conf_reset

	run_rofi_conf_reset

	run_fcitx_conf_reset

	run_gtk3_conf_reset

	run_gtk2_conf_reset
}

main_conf_reset "$@"
#
### Tail: main #################################################################
