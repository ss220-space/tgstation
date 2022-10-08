/mob/living/simple_animal/necromorph/slasher
	name = "necromorph slasher"
	icon = 'icons/necromorph/slasher.dmi'
	icon_state = "slasher"
	icon_living = "slasher"
	icon_dead = "slasher_lying"
	faction = "necromorph"
	health = 200
	maxHealth = 200
	melee_damage_lower = 40
	melee_damage_upper = 40
	pressure_resistance = 200
	pixel_x = -8
	base_pixel_x = -8
	unique_name = 1
	footstep_type = FOOTSTEP_MOB_SHOE
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0

	var/datum/action/cooldown/spell/night_vision/necromorph/night_vision
	var/datum/action/cooldown/spell/evolve_to_infector/evolve_to_infector

/mob/living/simple_animal/necromorph/slasher/Initialize(mapload)
		. = ..()
		ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
		evolve_to_infector = new
		night_vision = new
		night_vision.Grant(src)
		evolve_to_infector.Grant(src)

/datum/action/cooldown/spell/evolve_to_infector
	name = "Evolve to infector"
	desc = "Evolution! You can't regress after that!"
	panel = "Necromorph"
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "infector"
	background_icon_state = "bg_revenant"
	spell_requirements = NONE

/datum/action/cooldown/alien/evolve_to_infector/IsAvailable()
	. = ..()

	return TRUE

/datum/action/cooldown/alien/evolve_to_infector/Activate(atom/target)
	var/mob/living/simple_animal/necromorph/slasher/evolver = owner
	var/mob/living/simple_animal/necromorph/infector/new_xeno = new(owner.loc)
	return TRUE
