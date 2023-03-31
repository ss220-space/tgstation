///////////////////////////////////////////////////
//Skrell species, organs and human species define//
///////////////////////////////////////////////////


/datum/species/skrell
	name = "Skrell"
	plural_form = "Skrells"
	id = SPECIES_SKRELL
	species_traits = list(
		EYECOLOR,
		MUTCOLORS,
		LIPS,
	)
	coldmod = 1.25
	heatmod = 0.75
	brutemod = 1.20
	burnmod = 0.80
	bodytemp_normal = (BODYTEMP_NORMAL + 70)
	bodytemp_heat_damage_limit = FIRE_MINIMUM_TEMPERATURE_TO_SPREAD
	bodytemp_cold_damage_limit = (T20C - 10)
	species_language_holder = /datum/language_holder/skrell
	toxic_food = DAIRY | MEAT
	disliked_food = RAW | CLOTH
	liked_food = TOXIC | FRUIT | VEGETABLES
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	exotic_blood = /datum/reagent/copper
	payday_modifier = 0.75
	mutantbrain = /obj/item/organ/internal/brain/skrell
	mutanteyes = /obj/item/organ/internal/eyes/skrell
	mutantlungs = /obj/item/organ/internal/lungs/skrell
	mutantheart = /obj/item/organ/internal/heart/skrell
	mutantliver = /obj/item/organ/internal/liver/skrell
	mutanttongue = /obj/item/organ/internal/tongue/skrell
	external_organs = list(
		/obj/item/organ/external/skrell = "Screll Tentacles Short",
	)
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/skrell,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/skrell,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/skrell,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/skrell,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/skrell,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/skrell,
	)

/datum/species/skrell/randomize_features(mob/living/carbon/human_mob)
	randomize_external_organs(human_mob)

/mob/living/carbon/human/species/skrell
	race = /datum/species/skrell
