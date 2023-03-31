//I had to change make_datum_references_lists to code\__HELPERS\global_lists.dm and random_features in code\__HELPERS\mobs.dm for correct operation.
/////////////////////////////////////
//      code\__DEFINES\DNA.dm      //
/////////////////////////////////////

// #define DNA_FEATURE_BLOCKS 16
// #define DNA_SKRELL_HAIR_BLOCK 16
// #define ORGAN_SLOT_EXTERNAL_SKRELL_HAIR "skrell_hair"

// #define SPECIES_SKRELL "skrell"

GLOBAL_LIST_EMPTY(skrell_hair_list)
////////////////////////////////////
//       code\datums\dna.dm       //
////////////////////////////////////
/datum/dna/generate_unique_features()
	. = ""
	var/list/L = new /list(DNA_FEATURE_BLOCKS)

	if(features["mcolor"])
		L[DNA_MUTANT_COLOR_BLOCK] = sanitize_hexcolor(features["mcolor"], include_crunch = FALSE)
	if(features["ethcolor"])
		L[DNA_ETHEREAL_COLOR_BLOCK] = sanitize_hexcolor(features["ethcolor"], include_crunch = FALSE)
	if(features["body_markings"])
		L[DNA_LIZARD_MARKINGS_BLOCK] = construct_block(GLOB.body_markings_list.Find(features["body_markings"]), GLOB.body_markings_list.len)
	if(features["tail_cat"])
		L[DNA_TAIL_BLOCK] = construct_block(GLOB.tails_list_human.Find(features["tail_cat"]), GLOB.tails_list_human.len)
	if(features["tail_lizard"])
		L[DNA_LIZARD_TAIL_BLOCK] = construct_block(GLOB.tails_list_lizard.Find(features["tail_lizard"]), GLOB.tails_list_lizard.len)
	if(features["snout"])
		L[DNA_SNOUT_BLOCK] = construct_block(GLOB.snouts_list.Find(features["snout"]), GLOB.snouts_list.len)
	if(features["horns"])
		L[DNA_HORNS_BLOCK] = construct_block(GLOB.horns_list.Find(features["horns"]), GLOB.horns_list.len)
	if(features["frills"])
		L[DNA_FRILLS_BLOCK] = construct_block(GLOB.frills_list.Find(features["frills"]), GLOB.frills_list.len)
	if(features["spines"])
		L[DNA_SPINES_BLOCK] = construct_block(GLOB.spines_list.Find(features["spines"]), GLOB.spines_list.len)
	if(features["ears"])
		L[DNA_EARS_BLOCK] = construct_block(GLOB.ears_list.Find(features["ears"]), GLOB.ears_list.len)
	if(features["moth_wings"] != "Burnt Off")
		L[DNA_MOTH_WINGS_BLOCK] = construct_block(GLOB.moth_wings_list.Find(features["moth_wings"]), GLOB.moth_wings_list.len)
	if(features["moth_antennae"] != "Burnt Off")
		L[DNA_MOTH_ANTENNAE_BLOCK] = construct_block(GLOB.moth_antennae_list.Find(features["moth_antennae"]), GLOB.moth_antennae_list.len)
	if(features["moth_markings"])
		L[DNA_MOTH_MARKINGS_BLOCK] = construct_block(GLOB.moth_markings_list.Find(features["moth_markings"]), GLOB.moth_markings_list.len)
	if(features["caps"])
		L[DNA_MUSHROOM_CAPS_BLOCK] = construct_block(GLOB.caps_list.Find(features["caps"]), GLOB.caps_list.len)
	if(features["pod_hair"])
		L[DNA_POD_HAIR_BLOCK] = construct_block(GLOB.pod_hair_list.Find(features["pod_hair"]), GLOB.pod_hair_list.len)
	if(features["skrell_hair"])
		L[DNA_SKRELL_HAIR_BLOCK] = construct_block(GLOB.skrell_hair_list.Find(features["skrell_hair"]), GLOB.skrell_hair_list.len)

	for(var/blocknum in 1 to DNA_FEATURE_BLOCKS)
		. += L[blocknum] || random_string(GET_UI_BLOCK_LEN(blocknum), GLOB.hex_characters)


/datum/dna/update_uf_block(blocknumber)
	if(!blocknumber)
		CRASH("UF block index is null")
	if(!ishuman(holder))
		CRASH("Non-human mobs shouldn't have DNA")
	switch(blocknumber)
		if(DNA_MUTANT_COLOR_BLOCK)
			set_uni_feature_block(blocknumber, sanitize_hexcolor(features["mcolor"], include_crunch = FALSE))
		if(DNA_ETHEREAL_COLOR_BLOCK)
			set_uni_feature_block(blocknumber, sanitize_hexcolor(features["ethcolor"], include_crunch = FALSE))
		if(DNA_LIZARD_MARKINGS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.body_markings_list.Find(features["body_markings"]), GLOB.body_markings_list.len))
		if(DNA_TAIL_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.tails_list.Find(features["tail_lizard"]), GLOB.tails_list.len))
		if(DNA_SNOUT_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.snouts_list.Find(features["snout"]), GLOB.snouts_list.len))
		if(DNA_HORNS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.horns_list.Find(features["horns"]), GLOB.horns_list.len))
		if(DNA_FRILLS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.frills_list.Find(features["frills"]), GLOB.frills_list.len))
		if(DNA_SPINES_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.spines_list.Find(features["spines"]), GLOB.spines_list.len))
		if(DNA_EARS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.ears_list.Find(features["ears"]), GLOB.ears_list.len))
		if(DNA_MOTH_WINGS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.moth_wings_list.Find(features["moth_wings"]), GLOB.moth_wings_list.len))
		if(DNA_MOTH_ANTENNAE_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.moth_antennae_list.Find(features["moth_antennae"]), GLOB.moth_antennae_list.len))
		if(DNA_MOTH_MARKINGS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.moth_markings_list.Find(features["moth_markings"]), GLOB.moth_markings_list.len))
		if(DNA_MUSHROOM_CAPS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.caps_list.Find(features["caps"]), GLOB.caps_list.len))
		if(DNA_POD_HAIR_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.pod_hair_list.Find(features["pod_hair"]), GLOB.pod_hair_list.len))
		if(DNA_SKRELL_HAIR_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.skrell_hair_list.Find(features["skrell_hair"]),GLOB.skrell_hair_list.len))

/mob/living/carbon/human/updateappearance(icon_update=1, mutcolor_update=0, mutations_overlay_update=0)
	..()
	var/structure = dna.unique_identity
	hair_color = sanitize_hexcolor(get_uni_identity_block(structure, DNA_HAIR_COLOR_BLOCK))
	facial_hair_color = sanitize_hexcolor(get_uni_identity_block(structure, DNA_FACIAL_HAIR_COLOR_BLOCK))
	skin_tone = GLOB.skin_tones[deconstruct_block(get_uni_identity_block(structure, DNA_SKIN_TONE_BLOCK), GLOB.skin_tones.len)]
	eye_color_left = sanitize_hexcolor(get_uni_identity_block(structure, DNA_EYE_COLOR_LEFT_BLOCK))
	eye_color_right = sanitize_hexcolor(get_uni_identity_block(structure, DNA_EYE_COLOR_RIGHT_BLOCK))
	if(HAS_TRAIT(src, TRAIT_SHAVED))
		hairstyle = "Shaved"
	else
		facial_hairstyle = GLOB.facial_hairstyles_list[deconstruct_block(get_uni_identity_block(structure, DNA_FACIAL_HAIRSTYLE_BLOCK), GLOB.facial_hairstyles_list.len)]
	if(HAS_TRAIT(src, TRAIT_BALD))
		hairstyle = "Bald"
	else
		hairstyle = GLOB.hairstyles_list[deconstruct_block(get_uni_identity_block(structure, DNA_HAIRSTYLE_BLOCK), GLOB.hairstyles_list.len)]
	var/features = dna.unique_features
	if(dna.features["mcolor"])
		dna.features["mcolor"] = sanitize_hexcolor(get_uni_feature_block(features, DNA_MUTANT_COLOR_BLOCK))
	if(dna.features["ethcolor"])
		dna.features["ethcolor"] = sanitize_hexcolor(get_uni_feature_block(features, DNA_ETHEREAL_COLOR_BLOCK))
	if(dna.features["body_markings"])
		dna.features["body_markings"] = GLOB.body_markings_list[deconstruct_block(get_uni_feature_block(features, DNA_LIZARD_MARKINGS_BLOCK), GLOB.body_markings_list.len)]
	if(dna.features["snout"])
		dna.features["snout"] = GLOB.snouts_list[deconstruct_block(get_uni_feature_block(features, DNA_SNOUT_BLOCK), GLOB.snouts_list.len)]
	if(dna.features["horns"])
		dna.features["horns"] = GLOB.horns_list[deconstruct_block(get_uni_feature_block(features, DNA_HORNS_BLOCK), GLOB.horns_list.len)]
	if(dna.features["frills"])
		dna.features["frills"] = GLOB.frills_list[deconstruct_block(get_uni_feature_block(features, DNA_FRILLS_BLOCK), GLOB.frills_list.len)]
	if(dna.features["spines"])
		dna.features["spines"] = GLOB.spines_list[deconstruct_block(get_uni_feature_block(features, DNA_SPINES_BLOCK), GLOB.spines_list.len)]
	if(dna.features["tail_cat"])
		dna.features["tail_cat"] = GLOB.tails_list_human[deconstruct_block(get_uni_feature_block(features, DNA_TAIL_BLOCK), GLOB.tails_list_human.len)]
	if(dna.features["tail_lizard"])
		dna.features["tail_lizard"] = GLOB.tails_list_lizard[deconstruct_block(get_uni_feature_block(features, DNA_LIZARD_TAIL_BLOCK), GLOB.tails_list_lizard.len)]
	if(dna.features["ears"])
		dna.features["ears"] = GLOB.ears_list[deconstruct_block(get_uni_feature_block(features, DNA_EARS_BLOCK), GLOB.ears_list.len)]
	if(dna.features["moth_wings"])
		var/genetic_value = GLOB.moth_wings_list[deconstruct_block(get_uni_feature_block(features, DNA_MOTH_WINGS_BLOCK), GLOB.moth_wings_list.len)]
		dna.features["original_moth_wings"] = genetic_value
		dna.features["moth_wings"] = genetic_value
	if(dna.features["moth_antennae"])
		var/genetic_value = GLOB.moth_antennae_list[deconstruct_block(get_uni_feature_block(features, DNA_MOTH_ANTENNAE_BLOCK), GLOB.moth_antennae_list.len)]
		dna.features["original_moth_antennae"] = genetic_value
		dna.features["moth_antennae"] = genetic_value
	if(dna.features["moth_markings"])
		dna.features["moth_markings"] = GLOB.moth_markings_list[deconstruct_block(get_uni_feature_block(features, DNA_MOTH_MARKINGS_BLOCK), GLOB.moth_markings_list.len)]
	if(dna.features["caps"])
		dna.features["caps"] = GLOB.caps_list[deconstruct_block(get_uni_feature_block(features, DNA_MUSHROOM_CAPS_BLOCK), GLOB.caps_list.len)]
	if(dna.features["pod_hair"])
		dna.features["pod_hair"] = GLOB.pod_hair_list[deconstruct_block(get_uni_feature_block(features, DNA_POD_HAIR_BLOCK), GLOB.pod_hair_list.len)]
	if(dna.features["skrell_hair"])
		dna.features["skrell_hair"] = GLOB.skrell_hair_list[deconstruct_block(get_uni_feature_block(features, DNA_SKRELL_HAIR_BLOCK), GLOB.skrell_hair_list.len)]

	for(var/obj/item/organ/external/external_organ in organs)
		external_organ.mutate_feature(features, src)

	if(icon_update)
		dna.species.handle_body(src) // We want 'update_body_parts(update_limb_data = TRUE)' to be called only if mutcolor_update is TRUE, so no 'update_body()' here.
		update_body_parts() //We can call this because it doesnt refresh limb data, and it handles hair and such.
		if(mutcolor_update)
			update_body_parts(update_limb_data = TRUE)
		if(mutations_overlay_update)
			update_mutations_overlay()

/datum/dna/update_uf_block(blocknumber)
	if(!blocknumber)
		CRASH("UF block index is null")
	if(!ishuman(holder))
		CRASH("Non-human mobs shouldn't have DNA")
	switch(blocknumber)
		if(DNA_MUTANT_COLOR_BLOCK)
			set_uni_feature_block(blocknumber, sanitize_hexcolor(features["mcolor"], include_crunch = FALSE))
		if(DNA_ETHEREAL_COLOR_BLOCK)
			set_uni_feature_block(blocknumber, sanitize_hexcolor(features["ethcolor"], include_crunch = FALSE))
		if(DNA_LIZARD_MARKINGS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.body_markings_list.Find(features["body_markings"]), GLOB.body_markings_list.len))
		if(DNA_TAIL_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.tails_list.Find(features["tail_lizard"]), GLOB.tails_list.len))
		if(DNA_SNOUT_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.snouts_list.Find(features["snout"]), GLOB.snouts_list.len))
		if(DNA_HORNS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.horns_list.Find(features["horns"]), GLOB.horns_list.len))
		if(DNA_FRILLS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.frills_list.Find(features["frills"]), GLOB.frills_list.len))
		if(DNA_SPINES_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.spines_list.Find(features["spines"]), GLOB.spines_list.len))
		if(DNA_EARS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.ears_list.Find(features["ears"]), GLOB.ears_list.len))
		if(DNA_MOTH_WINGS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.moth_wings_list.Find(features["moth_wings"]), GLOB.moth_wings_list.len))
		if(DNA_MOTH_ANTENNAE_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.moth_antennae_list.Find(features["moth_antennae"]), GLOB.moth_antennae_list.len))
		if(DNA_MOTH_MARKINGS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.moth_markings_list.Find(features["moth_markings"]), GLOB.moth_markings_list.len))
		if(DNA_MUSHROOM_CAPS_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.caps_list.Find(features["caps"]), GLOB.caps_list.len))
		if(DNA_SKRELL_HAIR_BLOCK)
			set_uni_feature_block(blocknumber, construct_block(GLOB.skrell_hair_list.Find(features["skrell_hair"]), GLOB.skrell_hair_list.len))
