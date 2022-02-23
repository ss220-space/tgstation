//Everything related to fullscreen was put here in one file to make merges easier.
//TGUI implementation is in fullscreen.tsx

#define COMSIG_KB_CLIENT_TOGFULLSCREEN_DOWN "keybinding_client_togfullscreen_down"

/datum/preference/toggle/fullscreen
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "fullscreenpref"
	savefile_identifier = PREFERENCE_PLAYER
	default_value = FALSE

/datum/preference/toggle/fullscreen/apply_to_client(client/client, value)
	client.toggle_fullscreen(value)

/datum/keybinding/client/toggle_fullscreen
	hotkey_keys = list("F11")
	name = "toggle_fullscreen"
	full_name = "Enable Fullscreen"
	description = "Enables fullscreen"
	keybind_signal = COMSIG_KB_CLIENT_TOGFULLSCREEN_DOWN

/datum/keybinding/client/toggle_fullscreen/down(client/user)
	. = ..()
	if(.)
		return
	var/fullscreen = (winget(user, "mainwindow", "is-maximized") == "true")
	user.toggle_fullscreen(!fullscreen)

/client/proc/toggle_fullscreen(fullscreen = TRUE)
	if(fullscreen)
		winset(src, "mainwindow", "is-maximized=false;can-resize=false;titlebar=false;menus=menu") //Reset to not maximized and turn off titlebar.
		winset(src, "mainwindow", "is-maximized=true") //Now set to maximized. We have to do this separately, so that the taskbar is appropriately covered.
	else if(winget(src, "mainwindow", "is-maximized") == "true")
		winset(src, "mainwindow", "is-maximized=false;can-resize=true;titlebar=true;menus=menu")
