//////Duplicated from code\modules\surgery\organs\liver.dm/////////////
#define LIVER_DEFAULT_TOX_TOLERANCE 3 //amount of toxins the liver can filter out
#define LIVER_DEFAULT_TOX_RESISTANCE 1 //lower values lower how harmful toxins are to the liver
#define LIVER_FAILURE_STAGE_SECONDS 60 //amount of seconds before liver failure reaches a new stage
#define MAX_TOXIN_LIVER_DAMAGE 2 //the max damage the liver can recieve per second (~1 min at max damage will destroy liver)
///////////////////////////////////////////////////////////////////////

/obj/item/organ/internal/liver/skrell
	name = "skrell liver"
	icon_state = "liver"
	icon = 'modular_galactic/skrell/skrell_organs.dmi'
	alcohol_tolerance = 5
	toxTolerance = 10 //can shrug off up to 10u of toxins.
	liver_resistance = 1.2 * LIVER_DEFAULT_TOX_RESISTANCE


#undef LIVER_DEFAULT_TOX_TOLERANCE
#undef LIVER_DEFAULT_TOX_RESISTANCE
#undef LIVER_FAILURE_STAGE_SECONDS
#undef MAX_TOXIN_LIVER_DAMAGE

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
