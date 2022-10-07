/mob/living/simple_animal/hostile/necromorph
	name = "necromorph slasher"
	icon = 'icons/necromorph/slasher.dmi'
	icon_state = "slasher"
	icon_living = "slasher"
	icon_dead = "slasherlying"
	faction = "necromorph"
	health = 200
	maxHealth = 200
	melee_damage_lower = 40
	melee_damage_upper = 40
	pressure_resistance = 200

	var/datum/action/cooldown/spell/night_vision/night_vision
	var/datum/action/cooldown/alien/evolve_to_infector/evolution

/mob/living/simple_animal/hostile/necromorph/Initialize(mapload)
		. = ..()
		ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
		evolve_to_infector = new /datum/action/cooldown/alien/evolve_to_infector()
		evolve_to_infector.Grant(src)

/datum/action/cooldown/alien/evolve_to_infector
	name = "Evolve to infector"
	desc = "."
	panel = "Necromorph"
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "infector"

/datum/action/cooldown/alien/evolve_to_infector/IsAvailable()
	. = ..()
	if(!.)
		return FALSE

	if(!isturf(owner.loc))
		return FALSE

	if(get_alien_type(/mob/living/simple_animal/hostile/necromorph/infector) == 2)
		return FALSE

	var/mob/living/simple_animal/hostile/necromorph/evolver = owner

	return TRUE

/datum/action/cooldown/alien/evolve_to_infector/Activate(atom/target)
	var/mob/living/simple_animal/hostile/necromorph/evolver = owner
	var/mob/living/simple_animal/hostile/necromorph/infector/new_xeno = new(owner.loc)
	return TRUE