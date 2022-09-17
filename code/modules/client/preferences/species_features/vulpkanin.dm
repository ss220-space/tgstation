/proc/generate_vulpkanin_side_shots(list/sprite_accessories, key, include_snout = TRUE)
	var/list/values = list()

	var/icon/vulpkanin = icon('icons/mob/species/vulpkanin/bodyparts.dmi', "lizard_head", EAST)
	var/icon/eyes = icon('icons/mob/species/human/human_face.dmi', "eyes", EAST)
	eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
	vulpkanin.Blend(eyes, ICON_OVERLAY)

	if (include_snout)
		lizard.Blend(icon('icons/mob/species/mutant_bodyparts.dmi', "m_snout_wolf_ADJ", EAST), ICON_OVERLAY)

	for (var/name in sprite_accessories)
		var/datum/sprite_accessory/sprite_accessory = sprite_accessories[name]

		var/icon/final_icon = icon(Vulpkanin)

		if (sprite_accessory.icon_state != "none")
			var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", EAST)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

		final_icon.Crop(11, 20, 23, 32)
		final_icon.Scale(32, 32)
		final_icon.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)

		values[name] = final_icon

	return values

/datum/preference/choiced/lizard_snout
	savefile_key = "feature_vulpkanin_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Wolf"
	should_generate_icons = TRUE

/datum/preference/choiced/vulpkanin_snout/init_possible_values()
	return generate_vulpkanin_side_shots(vulpkanin_snouts_list, "snout", include_snout = FALSE)

/datum/preference/choiced/vulpkanin_snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["snout"] = value

/datum/preference/choiced/vulpkanin_tail
	savefile_key = "feature_vulpkanin_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_external_organ = /obj/item/organ/external/tail/vulpkanin

/datum/preference/choiced/vulpkanin_tail/init_possible_values()
	return assoc_to_keys(vulpkanin_tails_list)

/datum/preference/choiced/vulpkanin_tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_straighttail"] = value

/datum/preference/choiced/vulpkanin_tail/create_default_value()
	var/datum/sprite_accessory/tails/vulpkanin/straighttail/tail = /datum/sprite_accessory/tails/vulpkanin/straighttail
	return initial(tail.name)

/datum/preference/choiced/vulpkanin_ears
	savefile_key = "feature_vulpkanin_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	can_randomize = FALSE
	relevant_mutant_bodypart = "ears"

/datum/preference/choiced/vulpkanin_ears/init_possible_values()
	return assoc_to_keys(ears_list)

/datum/preference/choiced/vulpkanin_ears/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ears"] = value

/datum/preference/choiced/vulpkanin_ears/create_default_value()
	var/datum/sprite_accessory/ears/vulpkanin/wolf/ears = /datum/sprite_accessory/ears/vulpkanin/wolf
	return initial(ears.name)
