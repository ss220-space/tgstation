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

/obj/item/organ/internal/tongue/skrell
	name = "internal vocal sacs"
	desc = "An Strange looking sac."
	icon = 'modular_galactic/skrell/skrell_organs.dmi'
	icon_state = "tongue"
	taste_sensitivity = 5

/obj/item/organ/internal/tongue/skrell/get_possible_languages()
	return ..() + /datum/language/skrell

/obj/item/organ/internal/heart/skrell
	name = "skrellian heart"
	icon = 'modular_galactic/skrell/skrell_organs.dmi'
	icon_state = "heart-on"

/obj/item/organ/internal/brain/skrell
	name = "spongy brain"
	icon = 'modular_galactic/skrell/skrell_organs.dmi'
	icon_state = "brain2"

/obj/item/organ/internal/eyes/skrell
	name = "amphibian eyes"
	desc = "Large black orbs."
	icon = 'modular_galactic/skrell/skrell_organs.dmi'
	icon_state = "eyes"
	flash_protect = FLASH_PROTECTION_SENSITIVE

/obj/item/organ/internal/lungs/skrell
	name = "skrell lungs"
	icon = 'modular_galactic/skrell/skrell_organs.dmi'
	icon_state = "lungs"
	safe_plasma_max = 40
	safe_co2_max = 40

	cold_message = "You can't stand the freezing cold with every breath you take!"
	cold_level_1_threshold = 248
	cold_level_2_threshold = 220
	cold_level_3_threshold = 170
	cold_level_1_damage = COLD_GAS_DAMAGE_LEVEL_2 //Keep in mind with gas damage levels, you can set these to be negative, if you want someone to heal, instead.
	cold_level_2_damage = COLD_GAS_DAMAGE_LEVEL_2
	cold_level_3_damage = COLD_GAS_DAMAGE_LEVEL_3
	cold_damage_type = BRUTE


	hot_message = "You can't stand the searing heat with every breath you take!"
	heat_level_1_threshold = 318
	heat_level_2_threshold = 348
	heat_level_3_threshold = 1000
	heat_level_1_damage = HEAT_GAS_DAMAGE_LEVEL_2
	heat_level_2_damage = HEAT_GAS_DAMAGE_LEVEL_2
	heat_level_3_damage = HEAT_GAS_DAMAGE_LEVEL_3
	heat_damage_type = BURN

/mob/living/carbon/human/species/skrell
	race = /datum/species/skrell
