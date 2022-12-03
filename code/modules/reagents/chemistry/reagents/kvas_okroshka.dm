/datum/reagent/consumable/kvas
	name = "Kvass"
	description = "Ancient slavic drink"
	nutriment_factor = 0
	quality = DRINK_GOOD
	taste_description = "sweet"
	glass_icon_state = "fernetpuro"
	glass_name = "stakan of kvass"
	glass_desc = "Very vkusno."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/kvas/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(M.getToxLoss() && DT_PROB(10, delta_time))
		M.adjustToxLoss(-1, 0)
	..()
	. = TRUE

/obj/item/food/soup/okroshka
	name = "okroshka"
	desc = "Kvas is good. Kvas soup is even better."
	icon = 'icons/obj/food/okroshka.dmi'
	icon_state = "okroshka"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 8, /datum/reagent/consumable/kvas = 5, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("okroshka" = 1)
	foodtypes = VEGETABLES | MEAT
	venue_value = FOOD_PRICE_NORMAL