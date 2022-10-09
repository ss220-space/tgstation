/mob/living/simple_animal/necromorph/spitter
	name = "necromorph spitter"
	icon = 'icons/necromorph/spitter.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "bodylying"
	faction = ROLE_NECROMORPH
	health = 150
	maxHealth = 150
	pressure_resistance = 200
	pixel_x = -16
	base_pixel_x = -16
	pixel_y = -16
	base_pixel_y = -16
	melee_damage_lower = 15
	melee_damage_upper = 15
	footstep_type = FOOTSTEP_MOB_SHOE
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0

	var/datum/action/cooldown/spell/night_vision/necromorph/night_vision
	var/datum/action/cooldown/spell/aoe/repulse/xeno/necromorph/tail_whip
	var/datum/action/cooldown/spell/pointed/projectile/pukeshot/pukeshot
	var/datum/action/cooldown/spell/regress_to_slasher/regress

/mob/living/simple_animal/necromorph/spitter/Initialize(mapload)
		. = ..()
		ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
		tail_whip = new
		pukeshot = new
		night_vision = new
		regress = new
		night_vision.Grant(src)
		regress.Grant(src)
		tail_whip.Grant(src)
		pukeshot.Grant(src)

/datum/action/cooldown/spell/aoe/repulse/xeno/necromorph
	background_icon_state = "bg_revenant"
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	panel = "Necromorph"
	sparkle_path = NONE

/obj/projectile/pukeshot
	name = "pukeshot"
	damage = 30
	icon = 'icons/necromorph/necroprojectiles.dmi'
	icon_state = "pukeshot"

/datum/action/cooldown/spell/pointed/projectile/pukeshot
	name = "Pukeshot"
	desc = "A spit of acidic vomit that can burn through soft tissues."
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "pukeshot"
	panel = "Necromorph"
	background_icon_state = "bg_revenant"
	cooldown_time = 0 SECONDS
	spell_requirements = NONE

	active_msg = "Your mouth is filled with vomit!"
	deactive_msg = "You swallow the remnants of vomit."
	projectile_type = /obj/projectile/neurotox
