/datum/mentors/Topic(href, list/href_list)
	..()

	if(usr.client != src.owner || !check_rights(0))
		message_admins("[usr.key] has attempted to override the mentor panel!")
		log_admin("[key_name(usr)] tried to use the mentor panel without authorization.")
		return

	if(href_list["editmentor"])
		edit_rights_topic(href_list)

/datum/mentors/proc/edit_rights_topic(list/href_list)
	if(!check_rights(R_PERMISSIONS))
		message_admins("[key_name_admin(usr)] attempted to edit admin permissions without sufficient rights.")
		log_admin("[key_name(usr)] attempted to edit admin permissions without sufficient rights.")
		return
	if(IsAdminAdvancedProcCall())
		to_chat(usr, "<span class='admin prefix'>Admin Edit blocked: Advanced ProcCall detected.</span>", confidential = TRUE)
		return
	var/datum/asset/permissions_assets = get_asset_datum(/datum/asset/simple/namespaced/common)
	permissions_assets.send(usr.client)
	var/mentor_key = href_list["key"]
	var/mentor_ckey = ckey(mentor_key)
	var/task = href_list["editmentor"]
	switch(task)
		if("add")
			var/name = input(usr, "Please enter the CKEY:", "Add a mentor") as null|text
			if(!name)
				return

			var/player_to_be = ckey(name)
			if(!player_to_be)
				to_chat(usr, span_warning("\"[name]\" is not a valid CKEY."))
				return
			for(var/a_mentor as anything in GLOB.mentor_datums)
				if(player_to_be == a_mentor)
					to_chat(usr, span_warning("\"[player_to_be]\" is already a mentor!"))
					return
			// Now that we know that the ckey is valid and they're not already apart of that group, let's add them to it!
			new /datum/mentors(player_to_be)
			text2file(player_to_be, "[global.config.directory]/mentors.txt")
		if("remove")
			var/changes = FALSE
			for(var/a_mentor as anything in GLOB.mentor_datums)
				if(mentor_ckey == a_mentor)
					var/datum/mentors/mentor_datum = GLOB.mentor_datums[a_mentor]
					mentor_datum.remove_mentor()
					changes = TRUE
			if(!changes)
				to_chat(usr, span_warning("\"[mentor_ckey]\" was already not a mentor."))
			save_mentors()
