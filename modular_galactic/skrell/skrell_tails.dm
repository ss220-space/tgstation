////////////////////////////////////////////////////////////////////////
//Skrell tail external organ, action override and abstract pocket item//
////////////////////////////////////////////////////////////////////////

/obj/item/organ/external/skrell
	name = "skrell hair"
	icon = 'modular_galactic/skrell/skrell_organs.dmi'
	icon_state = "skrell_headpocket"
	desc = "For stroking these tails you can apply for alimony"
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_SKRELL_HAIR
	dna_block = DNA_SKRELL_HAIR_BLOCK
	preference = "feature_skrell_hair"
	actions_types = list(/datum/action/item_action/organ_action/use/skrell_pocket)
	restyle_flags = EXTERNAL_RESTYLE_FLESH
	bodypart_overlay = /datum/bodypart_overlay/mutant/skrell
	var/obj/item/storage/skrell_pocket/pocket

/datum/bodypart_overlay/mutant/skrell
	layers = EXTERNAL_FRONT|EXTERNAL_ADJACENT
	feature_key = "skrell_hair"

/datum/bodypart_overlay/mutant/skrell/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(!(human.head?.flags_inv & HIDEHAIR) || (human.wear_mask?.flags_inv & HIDEHAIR))
		return TRUE
	return FALSE

/obj/item/organ/external/skrell/ui_action_click(mob/user, actiontype)
	pocket.atom_storage?.open_storage(user)

/datum/bodypart_overlay/mutant/skrell/get_global_feature_list()
	return GLOB.skrell_hair_list

/obj/item/organ/external/skrell/Insert(mob/living/carbon/reciever, special, drop_if_replaced)
	. = ..()
	pocket = new /obj/item/storage/skrell_pocket(reciever)

/obj/item/organ/external/skrell/Remove(mob/living/carbon/organ_owner, special, moving)
	. = ..()
	if(src&&src.loc&&pocket&&pocket.atom_storage)
		pocket.atom_storage.remove_all()
		qdel(pocket)

/obj/item/storage/skrell_pocket
	name = "Skrell's pocket"
	desc = "Most likely you shouldn't see it"
	item_flags = ABSTRACT | DROPDEL
	resistance_flags = INDESTRUCTIBLE

/obj/item/storage/skrell_pocket/New(loc, ...)
	create_storage(storage_type = /datum/storage/skrell_pocket)

/datum/action/item_action/organ_action/use/skrell_pocket
	name = "Open pocket"
	button_icon = 'modular_galactic/skrell/skrell_organs.dmi'
	button_icon_state = "skrell_headpocket"
