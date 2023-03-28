/////////////////////////////////////////////////////////////////
//Storage datum and open_storage override for additional checks//
/////////////////////////////////////////////////////////////////

/datum/storage/skrell_pocket
	max_specific_storage = WEIGHT_CLASS_SMALL
	max_total_storage = 3
	max_slots = 1
	allow_big_nesting = FALSE

/datum/storage/skrell_pocket/open_storage(mob/to_show)
	var/obj/item/resolve_parent = parent?.resolve()
	if(!resolve_parent)
		return FALSE

	var/obj/item/resolve_location = real_location?.resolve()
	if(!resolve_location)
		return FALSE

	if(isobserver(to_show))
		show_contents(to_show)
		return FALSE

	if(istype(to_show,/mob/living/carbon))
		var/mob/living/carbon/C = to_show
		var/obj/item/storage/skrell_pocket/pocket = resolve_parent
		if(!pocket||!(pocket in C.contents))
			resolve_parent.balloon_alert(to_show, "Non-skrells can't use the pocket!")
			return FALSE
		else if(!is_species(to_show,/datum/species/skrell))
			resolve_parent.balloon_alert(to_show, "Non-skrells can't use the pocket!")
			return FALSE
		var/datum/dna/dna = C.has_dna()
		if(!dna||dna.features["skrell_hair"]=="Bald")
			resolve_parent.balloon_alert(to_show, "pocket cant be used without tails!")
			return FALSE


	if(!isliving(to_show) || to_show.incapacitated())
		return FALSE

	if(locked)
		if(!silent)
			resolve_parent.balloon_alert(to_show, "locked!")
		return FALSE

	if(!quickdraw || to_show.get_active_held_item())
		if(display_contents)
			show_contents(to_show)

		if(animated)
			animate_parent()

		if(rustle_sound)
			playsound(resolve_parent, SFX_RUSTLE, 50, TRUE, -5)

		return TRUE

	var/obj/item/to_remove = locate() in resolve_location

	if(!to_remove)
		return TRUE

	attempt_remove(to_remove)

	INVOKE_ASYNC(src, PROC_REF(put_in_hands_async), to_show, to_remove)

	if(!silent)
		to_show.visible_message(span_warning("[to_show] draws [to_remove] from [resolve_parent]!"), span_notice("You draw [to_remove] from [resolve_parent]."))

	return TRUE



