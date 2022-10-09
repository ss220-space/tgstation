/mob/living/simple_animal/necromorph/slasher
	name = "necromorph slasher"
	icon = 'icons/necromorph/slasher.dmi'
	icon_state = "slasher"
	icon_living = "slasher"
	icon_dead = "slasher_lying"
	faction = ROLE_NECROMORPH
	health = 200
	maxHealth = 200
	melee_damage_lower = 30
	melee_damage_upper = 30
	pressure_resistance = 200
	pixel_x = -8
	base_pixel_x = -8
	footstep_type = FOOTSTEP_MOB_SHOE
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0

	var/datum/action/cooldown/spell/night_vision/necromorph/night_vision
	var/datum/action/cooldown/spell/evolve_to_infector/evolve_to_infector
	var/datum/action/cooldown/spell/evolve_to_spitter/evolve_to_spitter
	var/datum/action/cooldown/spell/evolve_to_brute/evolve_to_brute

/mob/living/simple_animal/necromorph/slasher/Initialize(mapload)
		. = ..()
		ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
		evolve_to_infector = new
		night_vision = new
		evolve_to_spitter = new
		evolve_to_brute = new
		night_vision.Grant(src)
		evolve_to_infector.Grant(src)
		evolve_to_spitter.Grant(src)
		evolve_to_brute.Grant(src)

/datum/action/cooldown/spell/evolve_to_infector
	name = "Evolve to infector"
	desc = "Evolution!"
	panel = "Necromorph"
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "infector"
	background_icon_state = "bg_revenant"
	spell_requirements = NONE

/datum/action/cooldown/spell/evolve_to_spitter
	name = "Evolve to spitter"
	desc = "Evolution!"
	panel = "Necromorph"
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "spitter"
	background_icon_state = "bg_revenant"
	spell_requirements = NONE

/datum/action/cooldown/spell/evolve_to_brute
	name = "Evolve to brute"
	desc = "Evolution!"
	panel = "Necromorph"
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "brute"
	background_icon_state = "bg_revenant"
	spell_requirements = NONE

/mob/living/simple_animal/necromorph/proc/necromorph_evolve(var/mob/living/simple_animal/necromorph/infector/new_necromorph)
	visible_message(
		span_alertalien("[src] begins to twist and contort!"),
		span_noticealien("You begin to evolve!"),
	)
	new_necromorph.setDir(dir)
	if(numba && unique_name)
		new_necromorph.numba = numba
		new_necromorph.set_name()
	if(mind)
		mind.name = new_necromorph.real_name
		mind.transfer_to(new_necromorph)
	qdel(src)

/datum/action/cooldown/spell/evolve_to_infector/IsAvailable()
	. = ..()
	if(!.)
		return FALSE

	if(!isturf(owner.loc))
		return FALSE

	if(get_necromorph_type(/mob/living/simple_animal/necromorph/infector) == 2)
		return FALSE

	return TRUE

/datum/action/cooldown/spell/evolve_to_spitter/IsAvailable()
	. = ..()
	if(!.)
		return FALSE

	if(!isturf(owner.loc))
		return FALSE

	return TRUE

/datum/action/cooldown/spell/evolve_to_brute/IsAvailable()
	. = ..()
	if(!.)
		return FALSE

	if(!isturf(owner.loc))
		return FALSE

	if(get_necromorph_type(/mob/living/simple_animal/necromorph/brute) == 1)
		return FALSE

	return TRUE

/datum/action/cooldown/spell/evolve_to_infector/Activate(atom/target)
	var/mob/living/simple_animal/necromorph/evolver = owner
	var/mob/living/simple_animal/necromorph/infector/new_necromorph = new(owner.loc)
	evolver.necromorph_evolve(new_necromorph)
	return TRUE

/datum/action/cooldown/spell/evolve_to_spitter/Activate(atom/target)
	var/mob/living/simple_animal/necromorph/evolver = owner
	var/mob/living/simple_animal/necromorph/spitter/new_necromorph = new(owner.loc)
	evolver.necromorph_evolve(new_necromorph)
	return TRUE

/datum/action/cooldown/spell/evolve_to_brute/Activate(atom/target)
	var/mob/living/simple_animal/necromorph/evolver = owner
	var/mob/living/simple_animal/necromorph/brute/new_necromorph = new(owner.loc)
	evolver.necromorph_evolve(new_necromorph)
	return TRUE

/proc/get_necromorph_type(necromorphpath)
	for(var/mob/living/simple_animal/necromorph/A in GLOB.alive_mob_list)
		if(!istype(A, necromorphpath))
			continue
		if(!A.key || A.stat == DEAD) //Only living necromorphs with a ckey are valid.
			continue
		return A
	return FALSE
