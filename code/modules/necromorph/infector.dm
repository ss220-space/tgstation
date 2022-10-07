/mob/living/simple_animal/hostile/necromorph/infector
	name = "necromorph infector"
	icon = 'icons/necromorph/infector.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "bodylying"
	faction = "necromorph"
	health = 150
	maxHealth = 150
	melee_damage_lower = 15
	melee_damage_upper = 15
	pressure_resistance = 200
	retreat_distance = 5
	minimum_distance = 5

	var/datum/action/cooldown/alien/make_structure/infector/infector
	var/datum/action/cooldown/alien/make_structure/harvester/harvester

/mob/living/simple_animal/hostile/necromorph/infector/Initialize(mapload)
		. = ..()
		ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
		infector = new /datum/action/cooldown/alien/make_structure/infector/infector()
		harvester = new /datum/action/cooldown/alien/make_structure/harvester/harvester()
		infector.Grant(src)
		harvester.Grant(src)

/datum/action/cooldown/alien/make_structure/infector
	name = "Puke up infector"
	desc = "The infector spreads corruption throughout the station."
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "corruption-h"
	made_structure_type = /obj/structure/corruption/node

/datum/action/cooldown/alien/make_structure/harvester
	name = "Puke up harvester"
	desc = "Harvester extracts the biomass necessary for the spread of corruption and for the ability to."
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "harvester"
	made_structure_type = /obj/structure/corruption/node/harvester