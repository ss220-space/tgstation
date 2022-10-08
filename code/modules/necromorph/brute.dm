/mob/living/simple_animal/necromorph/brute
	name = "necromorph brute"
	icon = 'icons/necromorph/brute.dmi'
	icon_state = "brute"
	icon_living = "brute"
	icon_dead = "brute-dead"
	faction = "necromorph"
	health = 400
	maxHealth = 400
	pixel_x = -16
	base_pixel_x = -16
	maptext_height = 64
	maptext_width = 64
	pressure_resistance = 200
	melee_damage_lower = 60
	melee_damage_upper = 60
	unique_name = 1
	footstep_type = FOOTSTEP_MOB_SHOE
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0

	var/datum/action/cooldown/spell/night_vision/necromorph/night_vision
	var/datum/action/cooldown/mob_cooldown/charge/charge

/mob/living/simple_animal/necromorph/brute/Initialize(mapload)
	. = ..()
	charge = new
	night_vision = new
	night_vision.Grant(src)
	charge.Grant(src)
