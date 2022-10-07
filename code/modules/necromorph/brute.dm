/mob/living/simple_animal/hostile/necromorph/brute
	name = "necromorph brute"
	icon = 'icons/necromorph/brute.dmi'
	icon_state = "brute"
	icon_living = "brute"
	icon_dead = "brute-dead"
	faction = "necromorph"
	health = 400
	maxHealth = 400
	pressure_resistance = 200
	melee_damage_lower = 60
	melee_damage_upper = 60
	var/datum/action/cooldown/mob_cooldown/charge/triple_charge/triple_charge

/mob/living/simple_animal/hostile/necromorph/brute/Initialize(mapload)
	. = ..()
	triple_charge = new /datum/action/cooldown/mob_cooldown/triple_charge/triple_charge()
	triple_charge.Grant(src)

/mob/living/simple_animal/hostile/necromorph/brute/Destroy()
	QDEL_NULL(charge)
	return ..()

/mob/living/simple_animal/hostile/necromorph/brute/OpenFire()
	if(client)
		return
	charge.Trigger(target = target)