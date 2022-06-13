/client/proc/cmd_mentor_dementor()
	set category = "Mentor"
	set name = "Dementor"
	if(!is_mentor())
		return
	remove_mentor_verbs()
	if (/client/proc/mentor_unfollow in verbs)
		mentor_unfollow()
	GLOB.mentors -= src
	log_mentor("MENTOR: [src] dementored.")
	add_verb(src,/client/proc/cmd_mentor_rementor)

/client/proc/cmd_mentor_rementor()
	set category = "Mentor"
	set name = "Rementor"
	if(!is_mentor())
		return
	add_mentor_verbs()
	GLOB.mentors[src] = TRUE
	log_mentor("MENTOR: [src] rementored.")
	remove_verb(src,/client/proc/cmd_mentor_rementor)

/datum/preference/toggle/admin/auto_dementor
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "auto_dementor_pref"
	savefile_identifier = PREFERENCE_PLAYER
	default_value = FALSE // We want people to not automatically dementor by default, otherwise they just don't know about the fact they're mentors.
