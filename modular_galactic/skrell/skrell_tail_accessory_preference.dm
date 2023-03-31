/datum/preference/choiced/skrell_hair
	savefile_key = "feature_skrell_hair"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Hairstyle"
	should_generate_icons = TRUE

/datum/preference/choiced/skrell_hair/init_possible_values()
	var/list/values = list()
	var/icon/skrell_head = icon('modular_galactic/skrell/bodyparts.dmi', "skrell_head_m")

	for (var/tentacle in GLOB.skrell_hair_list)
		var/datum/sprite_accessory/skrell_hair = GLOB.skrell_hair_list[tentacle]
		if(skrell_hair.locked)
			continue

		var/icon/icon_with_hair = new(skrell_head)
		var/icon/icon_adj = icon(skrell_hair.icon, "m_skrell_hair_[skrell_hair.icon_state]_ADJ")
		var/icon/icon_front = icon(skrell_hair.icon, "m_skrell_hair_[skrell_hair.icon_state]_FRONT")
		icon_adj.Blend(icon_front, ICON_OVERLAY)
		icon_with_hair.Blend(icon_adj, ICON_OVERLAY)
		icon_with_hair.Scale(64, 64)
		icon_with_hair.Crop(15, 64, 15 + 31, 64 - 31)
		icon_with_hair.Blend(COLOR_RED, ICON_MULTIPLY)

		values[skrell_hair.name] = icon_with_hair

	return values

/datum/preference/choiced/skrell_hair/create_default_value()
	return pick(assoc_to_keys_features(GLOB.skrell_hair_list))

/datum/preference/choiced/skrell_hair/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["skrell_hair"] = value
