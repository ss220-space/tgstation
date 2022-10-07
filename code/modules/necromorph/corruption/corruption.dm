#DEFINE NODERANGE 3
/obj/structure/corruption
	gender = PLURAL
	name = "corruption floor"
	desc = "A biomass covers the floor."
	anchored = TRUE
	density = FALSE
	layer = TURF_LAYER
	plane = FLOOR_PLANE
	icon = 'icons/necromorph/corruption.dmi'
	icon_state = "corruption-1"
	max_integrity = 15
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_ALIEN_RESIN, SMOOTH_GROUP_ALIEN_WEEDS)
	canSmoothWith = list(SMOOTH_GROUP_WALLS, SMOOTH_GROUP_ALIEN_WEEDS)
	///the range of the weeds going to be affected by the node
	var/node_range = NODERANGE
	///the parent node that will determine if we grow or die
	var/obj/structure/corruption/node/parent_node
	///the list of turfs that the weeds will not be able to grow over
	var/static/list/blacklisted_turfs = list(
		/turf/open/space,
		/turf/open/chasm,
		/turf/open/lava,
		/turf/open/water,
		/turf/open/openspace,
	)

/obj/structure/corruption/proc/set_icon_state()
	. = icon_state
	switch(rand(1,3))
		if(1)
			icon_state = "corruption-1"
		if(2)
			icon_state = "corruption-2"
		if(3)
			icon_state = "corruption-3"

/obj/structure/corruption/node
	name = "floor infector"
	desc = "A vile spreading liquid of flesh, blood and meat. Disgusting."
	icon = 'icons/necromorph/corruption.dmi'
	icon_state = "corruption-infector"
	light_color = LIGHT_COLOR_YELLOW
	light_power = 0.3
	///the range of the light for the node
	var/lon_range = 2
	///the minimum time it takes for another weed to spread from this one
	var/minimum_growtime = 5 SECONDS
	///the maximum time it takes for another weed to spread from this one
	var/maximum_growtime = 7 SECONDS
	//the cooldown between each growth
	COOLDOWN_DECLARE(growtime)

/obj/structure/corruption/node/harvester
	name = "biomass harvester"
	desc = "A bunch of flesh and blood merged into one pile. It stinks.."
	icon = 'icons/necromorph/corruption.dmi'
	icon_state = "harvester"