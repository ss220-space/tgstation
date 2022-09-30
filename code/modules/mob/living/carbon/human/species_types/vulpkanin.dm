/datum/species/vulpkanin
	name = "Vulpkanin"
	id = SPECIES_VULPKANIN
	say_mod = "woofs"
	species_traits = list(MUTCOLORS, EYECOLOR, LIPS, HAS_FLESH, HAS_BONE, HAIR)
	inherent_traits = list(
		TRAIT_CAN_USE_FLIGHT_POTION,
	)

	mutant_bodyparts = list("body_markings" = "None")
	external_organs = list(
		/obj/item/organ/external/tail/vulpkanin,
		/obj/item/organ/external/snout/vulpkanin
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT

	attack_verb = "slash"
	attack_effect = ATTACK_EFFECT_CLAW
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'

	bodytemp_heat_damage_limit = (BODYTEMP_HEAT_DAMAGE_LIMIT - 10)
	bodytemp_cold_damage_limit = (BODYTEMP_COLD_DAMAGE_LIMIT + 20)

	disliked_food = VEGETABLES | FRUIT | GRAIN
	liked_food = MEAT | RAW | DAIRY | GROSS
	payday_modifier = 0.75
	heatmod = 1.5
	ass_image = 'icons/ass/assvulp.png'

	mutantheart = /obj/item/organ/internal/heart/vulpkanin
	mutantlungs = /obj/item/organ/internal/lungs/vulpkanin
	mutantliver = /obj/item/organ/internal/liver/vulpkanin
	mutanteyes = /obj/item/organ/internal/eyes/vulpkanin
	mutantears = /obj/item/organ/internal/ears/vulpkanin

	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/vulpkanin,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/vulpkanin,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/vulpkanin,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/vulpkanin,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/vulpkanin,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/vulpkanin,
	)

//Lore

/datum/species/vulpkanin/get_species_description()
	return "Vulpkanins... Seriously..?"

/datum/species/vulpkanin/get_species_lore()
	return list(
		"Vulpkanin are a species of sharp-witted canine-pideds residing on the planet Altam just barely within the \
	dual-star Vazzend system. Their politically de-centralized society and independent natures have led them to become a species and \
	culture both feared and respected for their scientific breakthroughs. Discovery, loyalty, and utilitarianism dominates their lifestyles \
	to the degree it can cause conflict with more rigorous and strict authorities. They speak a guttural language known as 'Canilunzt' \
    which has a heavy emphasis on utilizing tail positioning and ear twitches to communicate intent.",
	)

// Perk

/datum/species/vulpkanin/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "grin-tongue",
			SPECIES_PERK_NAME = "Grooming",
			SPECIES_PERK_DESC = "Vulpkanins can lick wounds to reduce bleeding.",
		),
	)

	return to_add

//Organs

/obj/item/organ/internal/liver/vulpkanin
	name = "vulpkanin liver"
	icon = 'icons/obj/medical/organs/organs.dmi'
	icon_state = "liver-v"

/obj/item/organ/internal/eyes/vulpkanin
	name = "vulpkanin eyeballs"
	icon = 'icons/obj/medical/organs/organs.dmi'
	icon_state = "eyes-v"

/obj/item/organ/internal/heart/vulpkanin
	name = "vulpkanin heart"
	icon = 'icons/obj/medical/organs/organs.dmi'
	icon_state = "heart-v"

/obj/item/organ/internal/brain/vulpkanin
	icon = 'icons/obj/medical/organs/organs.dmi'
	icon_state = "brain-v"

/obj/item/organ/internal/lungs/vulpkanin
	name = "vulpkanin lungs"
	icon = 'icons/obj/medical/organs/organs.dmi'
	icon_state = "lungs-v"

/obj/item/organ/internal/kidneys/vulpkanin
	name = "vulpkanin kidneys"
	icon = 'icons/obj/medical/organs/organs.dmi'
	icon_state = "kidneys-v"

//Tails
//icons/mob/species/mutant_bodyparts.dmi

var/list/vulpkanin_tails_list() = list(
	/obj/item/organ/external/tail/vulpkanin,
	/obj/item/organ/external/tail/vulpkanin/fox,
	/obj/item/organ/external/tail/vulpkanin/wolf
)

/obj/item/organ/external/tail/vulpkanin
	name = "vulpkanin tail"
	preference = "feature_straighttail_tail"
	feature_key = "tail_straighttail"
	wag_flags = WAG_ABLE

/obj/item/organ/external/tail/vulpkanin/fox
	preference = "feature_fox_tail"
	feature_key = "tail_fox"

/obj/item/organ/external/tail/vulpkanin/wolf
	preference = "feature_wolf_tail"
	feature_key = "tail_wolf"

//Ears

var/list/vulpkanin_ears_list() = list(
	/obj/item/organ/internal/ears/vulpkanin,
	/obj/item/organ/internal/ears/vulpkanin/dark,
	/obj/item/organ/internal/ears/vulpkanin/fox,
	/obj/item/organ/internal/ears/vulpkanin/sabresune,
	/obj/item/organ/internal/ears/vulpkanin/sergal
)

/obj/item/organ/internal/ears/vulpkanin
	name = "vulpkanin ears"
	icon = 'icons/mob/species/mutant_bodyparts.dmi'
	icon_state = "m_ears_bigwolf_FRONT"
	visual = TRUE

/obj/item/organ/internal/ears/vulpkanin/dark
	icon_state = "m_ears_bigwolfdark_FRONT"

/obj/item/organ/internal/ears/vulpkanin/fox
	icon_state = "m_ears_fox_FRONT"

/obj/item/organ/internal/ears/vulpkanin/sabresune
	icon_state = "m_ears_sabresune_ADJ"

/obj/item/organ/internal/ears/vulpkanin/sergal
	icon_state = "m_ears_sergal_ADJ"

//Snouts

var/list/vulpkanin_snouts_list() = list(
	/obj/item/organ/external/snout/vulpkanin,
	/obj/item/organ/external/snout/vulpkanin/fsharp,
	/obj/item/organ/external/snout/vulpkanin/flcanid
)

/obj/item/organ/external/snout/vulpkanin
	name = "vulpkanin snout"
	icon = 'icons/mob/species/mutant_bodyparts.dmi'

	feature_key = "snout_wolf"
	preference = "feature_wolf_snout"
	layers = EXTERNAL_ADJACENT

/obj/item/organ/external/snout/vulpkanin/fsharp
	feature_key = "snout_fsharp"
	preference = "feature_fsharp_snout"

/obj/item/organ/external/snout/vulpkanin/flcanid
	feature_key = "snout_flcanid"
	preference = "feature_flcanid_snout"