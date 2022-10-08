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
	var/datum/action/cooldown/mob_cooldown/charge/brute/charge

/mob/living/simple_animal/necromorph/brute/Initialize(mapload)
	. = ..()
	charge = new
	night_vision = new
	night_vision.Grant(src)
	charge.Grant(src)

/datum/action/cooldown/mob_cooldown/charge/brute
	name = "Charge"
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "charge"
	background_icon_state = "bg_revenant"
	desc = "Allows you to charge at a chosen position."
	cooldown_time = 1.5 SECONDS

/datum/action/cooldown/mob_cooldown/charge/brute/do_charge_indicator(atom/charger, atom/charge_target)
	var/turf/target_turf = get_turf(charge_target)
	if(!target_turf)
		return
	new /obj/effect/temp_visual/brute_charge(target_turf)
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(charger.loc, charger)
	animate(D, alpha = 0, transform = matrix()*2, time = 3)

/obj/effect/temp_visual/brute_charge
	name = "charge mark"
	desc = "It seems that if you stand in this place - your bones will break."
	icon = 'icons/necromorph/mastersignal.dmi'
	icon_state = "mastersignal"
	layer = BELOW_MOB_LAYER
	plane = GAME_PLANE
	pixel_x = -8
	pixel_y = -8
	duration = 10
