/datum/team/necromorph
	name = "Necromorphs"

//Simply lists them.
/datum/team/necromorph/roundend_report()
	var/list/parts = list()
	parts += "<span class='header'>The [name] were:</span>"
	parts += printplayerlist(members)
	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"

/datum/antagonist/necromorph
	name = "\improper Necromorph"
	job_rank = ROLE_NECROMORPH
	show_in_antagpanel = FALSE
	prevent_roundtype_conversion = FALSE
	show_to_ghosts = TRUE
	var/datum/team/necromorph/necromorph_team

/datum/antagonist/necromorph/create_team(datum/team/necromorph/new_team)
	if(!new_team)
		for(var/datum/antagonist/necromorph/X in GLOB.antagonists)
			if(!X.owner || !X.necromorph_team)
				continue
			necromorph_team = X.necromorph_team
			return
		necromorph_team = new
	else
		if(!istype(new_team))
			CRASH("Wrong necromorph team type provided to create_team")
		necromorph_team = new_team

/datum/antagonist/necromorph/get_team()
	return necromorph_team

/datum/antagonist/necromorph/get_preview_icon()
	return finish_preview_icon(icon('icons/mob/nonhuman-player/alien.dmi', "alienh"))

/datum/antagonist/necromorph/greet()
	to_chat(owner.current, span_alertsyndie("You are the Necromorph."))
	to_chat(owner.current, "Плоть. Кровь. Биомасса. Несите трупы людишек Обелиску, и тогда он даст вам силы, для захвата станции и самое главное - Эвакуационного Шаттла. Он понадобится нашему Обелиску для распространения в другие сектора!")
	owner.announce_objectives()

/datum/antagonist/necromorph/proc/forge_objectives()
	if(necromorph_team)
		objectives = "Захватите станцию и эвакуационный шаттл. Защищайте Обелиск любой ценой!"

/mob/living/simple_animal/necromorph/mind_initialize()
	..()
	if(!mind.has_antag_datum(/datum/antagonist/necromorph))
		mind.add_antag_datum(/datum/antagonist/necromorph)
		mind.set_assigned_role(SSjob.GetJobType(/datum/job/necromorph))
		mind.special_role = ROLE_NECROMORPH

/mob/living/simple_animal/necromorph/on_wabbajacked(mob/living/new_mob)
	. = ..()
	if(!mind)
		return
	if(isalien(new_mob))
		return
	mind.remove_antag_datum(/datum/antagonist/necromorph)
	mind.set_assigned_role(SSjob.GetJobType(/datum/job/unassigned))
	mind.special_role = null