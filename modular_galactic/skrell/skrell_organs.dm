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
	alcohol_tolerance = 3
	toxTolerance = 10 //can shrug off up to 10u of toxins.
	liver_resistance = 1.2 * LIVER_DEFAULT_TOX_RESISTANCE


#undef LIVER_DEFAULT_TOX_TOLERANCE
#undef LIVER_DEFAULT_TOX_RESISTANCE
#undef LIVER_FAILURE_STAGE_SECONDS
#undef MAX_TOXIN_LIVER_DAMAGE
