/datum/reagent/consumable/kvas
	name = "Kvass"
	description = "Ancient slavic drink"
	nutriment_factor = 0
	quality = DRINK_GOOD
	taste_description = "sweet"
	glass_icon_state = "fernetpuro"
	glass_name = "stakan of kvass"
	glass_desc = "From love with Russia"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/kvas/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(M.getToxLoss() && DT_PROB(10, delta_time))
		M.adjustToxLoss(-1, 0)
	..()
	. = TRUE

/datum/chemical_reaction/drink/kvas
	results = list(/datum/reagent/consumable/kvas = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol/beer = 2, /datum/reagent/consumable/sugar = 1)
	required_catalysts = list(/datum/reagent/consumable/enzyme = 5)

/obj/item/reagent_containers/cup/kvas
	name = "kvass bottle"
	desc = "A bottled cheap kvas."
	volume = 50
	icon = 'code/modules/food_and_drinks/kvas/kvas_sprites.dmi'
	icon_state = "kvas_bottle"
	list_reagents = list(/datum/reagent/consumable/kvas = 50)

/datum/supply_pack/materials/kvastank
	name = "Kvass Barrel Crate"
	desc = "Contains a classic kvass barrel"
	cost = CARGO_CRATE_VALUE * 1.6
	contains = list(/obj/structure/reagent_dispensers/kvastank)
	crate_name = "kvass barrel crate"
	crate_type = /obj/structure/closet/crate/large

/obj/structure/reagent_dispensers/kvastank
	name = "barrel of kvass"
	desc = "A yellow barrel full of kvass. No there is no worms inside."
	icon = 'code/modules/food_and_drinks/kvas/kvas_sprites.dmi'
	icon_state = "kvas_tank"
	reagent_id = /datum/reagent/consumable/kvas
	tank_volume = 1000
	openable = TRUE

/obj/item/food/soup/okroshka
	name = "okroshka"
	desc = "Kvas is good. Kvas soup is even better."
	icon = 'code/modules/food_and_drinks/kvas/kvas_sprites.dmi'
	icon_state = "okroshka"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 8, /datum/reagent/consumable/kvas = 5, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("okroshka" = 1)
	foodtypes = VEGETABLES | MEAT
	venue_value = FOOD_PRICE_NORMAL

/datum/crafting_recipe/food/oksroshka
	name = "Okroshka"
	reqs = list(
		/datum/reagent/consumable/kvas = 20,
		/obj/item/reagent_containers/cup/bowl = 1,
		/obj/item/food/grown/cucumber = 1,
		/obj/item/food/meat/rawcutlet = 1,
	)
	result = /obj/item/food/soup/okroshka
	subcategory = CAT_SOUP