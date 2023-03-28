///////////////////////////////////////////////////
//                  Skrell eyes                  //
///////////////////////////////////////////////////

#define OFFSET_X 1
#define OFFSET_Y 2
/obj/item/organ/internal/eyes/skrell/generate_body_overlay(mob/living/carbon/human/parent)
	if(!istype(parent) || parent.getorgan(/obj/item/organ/internal/eyes) != src)
		CRASH("Generating a body overlay for [src] targeting an invalid parent '[parent]'.")

	var/mutable_appearance/eye_left = mutable_appearance('modular_galactic/skrell/skrell_eyes.dmi', "[eye_icon_state]_l", -BODY_LAYER)
	var/mutable_appearance/eye_right = mutable_appearance('modular_galactic/skrell/skrell_eyes.dmi', "[eye_icon_state]_r", -BODY_LAYER)
	var/list/overlays = list(eye_left, eye_right)

	if(EYECOLOR in parent.dna?.species.species_traits)
		eye_right.color = eye_color_right
		eye_left.color = eye_color_left

	var/obscured = parent.check_obscured_slots(TRUE)
	if(overlay_ignore_lighting && !(obscured & ITEM_SLOT_EYES))
		eye_left.overlays += emissive_appearance(eye_left.icon, eye_left.icon_state, parent, alpha = eye_left.alpha)
		eye_right.overlays += emissive_appearance(eye_right.icon, eye_right.icon_state, parent, alpha = eye_right.alpha)


	if(OFFSET_FACE in parent.dna?.species.offset_features)
		var/offset = parent.dna.species.offset_features[OFFSET_FACE]
		for(var/mutable_appearance/overlay in overlays)
			overlay.pixel_x += offset[OFFSET_X]
			overlay.pixel_y += offset[OFFSET_Y]

	return overlays

#undef OFFSET_X
#undef OFFSET_Y
