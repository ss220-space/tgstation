/mob/living/simple_animal/hostile/necromorph/spitter
	name = "necromorph spitter"
	icon = 'icons/necromorph/spitter.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "bodylying"
	faction = "necromorph"
	health = 150
	maxHealth = 150
	pressure_resistance = 200
	melee_damage_lower = 15
	melee_damage_upper = 15
	var/datum/action/cooldown/spell/aoe/repulse/xeno/necromorph/tail_whip
	var/datum/action/cooldown/spell/pointed/projectile/pukeshot/pukeshot
/mob/living/simple_animal/hostile/necromorph/spitter/Initialize(mapload)
		. = ..()
		ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
		tail_whip = new /datum/action/cooldown/spell/aoe/repulse/xeno/necromorph/tail_whip()
		pukeshot = new /datum/action/cooldown/spell/pointed/projectile/pukeshot/pukeshot()
		tail_whip.Grant(src)
		pukeshot.Grant(src)

/datum/action/cooldown/spell/aoe/repulse/xeno/necromorph
	background_icon_state = "bg_revenant"
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	panel = "Necromorph"

/obj/projectile/pukeshot
	name = "pukeshot"
	damage = 30
	icon = 'icons/necromorph/necroprojectiles.dmi'
	icon_state = "pukeshot"

/datum/action/cooldown/spell/pointed/projectile/pukeshot
	name = "Pukeshot"
	desc = "A spit of acidic vomit that can burn through soft tissues."
	icon_icon = 'icons/mob/actions/actions_necromorph.dmi'
	button_icon_state = "pukeshot-1"
	panel = "Necromorph"
	cooldown_time = 2 SECONDS

	base_icon_state = "pukeshot"
	active_msg = "Your mouth is filled with vomit!"
	deactive_msg = "You swallow the remnants of vomit."
	projectile_type = /obj/projectile/pukeshot