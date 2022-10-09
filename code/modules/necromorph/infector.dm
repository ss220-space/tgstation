/mob/living/simple_animal/necromorph/infector
	name = "necromorph infector"
	icon = 'icons/necromorph/infector.dmi'
	icon_state = "infector"
	icon_living = "infector"
	icon_dead = "infector-lying"
	faction = ROLE_NECROMORPH
	health = 150
	maxHealth = 150
	melee_damage_lower = 15
	melee_damage_upper = 15
	pressure_resistance = 200
	pixel_x = -8
	base_pixel_x = -8
	footstep_type = FOOTSTEP_MOB_SHOE
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0

	var/datum/action/cooldown/spell/night_vision/necromorph/night_vision
	var/datum/action/cooldown/spell/conjure/infector/infector
	var/datum/action/cooldown/spell/conjure/harvester/harvester
	var/datum/action/cooldown/spell/regress_to_slasher/regress

/mob/living/simple_animal/necromorph/infector/Initialize(mapload)
		. = ..()
		ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
		infector = new
		harvester = new
		night_vision = new
		regress = new
		night_vision.Grant(src)
		regress.Grant(src)
		infector.Grant(src)
		harvester.Grant(src)

/datum/action/cooldown/spell/conjure/infector
	name = "Puke up infector"
	desc = "The infector spreads corruption throughout the station."
	background_icon_state = "bg_revenant"
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "corruption-h"

	cooldown_time = 30 SECONDS
	invocation_type = INVOCATION_NONE
	spell_requirements = NONE

	summon_radius = 0
	summon_type = list(/obj/structure/corruption/node)

/datum/action/cooldown/spell/conjure/harvester
	name = "Puke up harvester"
	desc = "Harvester extracts the biomass necessary for the spread of corruption and for the ability to."
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "harvester"
	background_icon_state = "bg_revenant"

	cooldown_time = 120 SECONDS
	invocation_type = INVOCATION_NONE
	spell_requirements = NONE

	summon_radius = 0
	summon_type = list(/obj/structure/corruption/node/harvester)

/datum/action/cooldown/spell/night_vision/necromorph
	name = "Strain your eyes"
	desc = "You strain your eyes to see better in the dark."
	background_icon_state = "bg_revenant"
	icon_icon = 'icons/mob/actions/actions_ecult.dmi'
	button_icon_state = "eye"
	cooldown_time = 0 SECONDS

/datum/action/cooldown/spell/regress_to_slasher
	name = "Regress to slasher"
	desc = "Evolution! But in the opposite direction..."
	panel = "Necromorph"
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "slasher"
	background_icon_state = "bg_revenant"
	spell_requirements = NONE

/mob/living/simple_animal/necromorph/proc/infector_regress(var/mob/living/simple_animal/necromorph/slasher/new_necromorph)
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

/datum/action/cooldown/spell/regress_to_slasher/IsAvailable()
	. = ..()
	if(!.)
		return FALSE

	if(!isturf(owner.loc))
		return FALSE

	return TRUE

/datum/action/cooldown/spell/regress_to_slasher/Activate(atom/target)
	var/mob/living/simple_animal/necromorph/evolver = owner
	var/mob/living/simple_animal/necromorph/slasher/new_necromorph = new(owner.loc)
	evolver.infector_regress(new_necromorph)
	return TRUE
