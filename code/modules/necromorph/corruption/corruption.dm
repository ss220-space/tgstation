#define NODERANGE 3
/obj/structure/corruption
	gender = PLURAL
	name = "corruption floor"
	desc = "A biomass covers the floor."
	anchored = TRUE
	density = FALSE
	layer = TURF_LAYER
	plane = FLOOR_PLANE
	icon = 'icons/necromorph/corruption.dmi'
	icon_state = ""
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

/obj/structure/corruption/Initialize(mapload)
	//so the sprites line up right in the map editor

	. = ..()

	AddElement(/datum/element/atmos_sensitive, mapload)

/obj/structure/corruption/Destroy()
	if(parent_node)
		UnregisterSignal(parent_node, COMSIG_PARENT_QDELETING)
		parent_node = null
	return ..()

/obj/structure/corruption/update_icon()
	icon_state = "corruption-[rand(1,3)]"

/obj/structure/corruption/proc/try_expand()
	//we cant grow without a parent node
	if(!parent_node)
		return
	//lets make sure we are still on a valid location
	var/turf/src_turf = get_turf(src)
	if(is_type_in_list(src_turf, blacklisted_turfs))
		qdel(src)
		return
	//lets try to grow in a direction
	for(var/turf/check_turf in src_turf.get_atmos_adjacent_turfs())
		//we cannot grow on blacklisted turfs
		if(is_type_in_list(check_turf, blacklisted_turfs))
			continue
		var/obj/structure/corruption/check_weed = locate() in check_turf
		//we cannot grow onto other weeds
		if(check_weed)
			continue
		//spawn a new one in the turf
		check_weed = new(check_turf)
		//set the new one's parent node to our parent node
		check_weed.parent_node = parent_node
		check_weed.RegisterSignal(parent_node, COMSIG_PARENT_QDELETING, .proc/after_parent_destroyed)

/**
 * Called when the parent node is destroyed
 */
/obj/structure/corruption/proc/after_parent_destroyed()
	if(!find_new_parent())
		var/random_time = rand(2 SECONDS, 8 SECONDS)
		addtimer(CALLBACK(src, .proc/do_qdel), random_time)

/**
 * Called when trying to find a new parent after our previous parent died
 * Will return false if it can't find a new_parent
 * Will return the new parent if it can find one
 */
/obj/structure/corruption/proc/find_new_parent()
	var/previous_node = parent_node
	parent_node = null
	for(var/obj/structure/corruption/node/new_parent in range(node_range, src))
		if(new_parent == previous_node)
			continue
		parent_node = new_parent
		RegisterSignal(parent_node, COMSIG_PARENT_QDELETING, .proc/after_parent_destroyed)
		return parent_node
	return FALSE

/**
 * Called to delete the weed
 */
/obj/structure/corruption/proc/do_qdel()
	qdel(src)

/obj/structure/corruption/should_atmos_process(datum/gas_mixture/air, exposed_temperature)
	return exposed_temperature > 300

/obj/structure/corruption/atmos_expose(datum/gas_mixture/air, exposed_temperature)
	take_damage(5, BURN, 0, 0)

/obj/structure/corruption/node
	name = "floor infector"
	desc = "A vile spreading liquid of flesh, blood and meat. Disgusting."
	icon = 'icons/necromorph/corruption.dmi'
	icon_state = "corruption-infector"
	light_color = LIGHT_COLOR_YELLOW
	light_power = 0.5
	///the range of the light for the node
	var/lon_range = 3
	///the minimum time it takes for another weed to spread from this one
	var/minimum_growtime = 5 SECONDS
	///the maximum time it takes for another weed to spread from this one
	var/maximum_growtime = 7 SECONDS
	//the cooldown between each growth
	COOLDOWN_DECLARE(growtime)

/obj/structure/corruption/node/harvester
	name = "biomass harvester"
	desc = "A bunch of flesh and blood merged into one pile. It stinks.."
	icon = 'icons/necromorph/harvester.dmi'
	icon_state = "harvester"
	pixel_x = -8
	base_pixel_x = -8

/obj/structure/corruption/node/Initialize(mapload)
	. = ..()

	//give it light
	set_light(lon_range)

	//we are the parent node
	parent_node = src

	//destroy any non-node weeds on turf
	var/obj/structure/corruption/check_weed = locate(/obj/structure/corruption) in loc
	if(check_weed && check_weed != src)
		qdel(check_weed)

	//start the cooldown
	COOLDOWN_START(src, growtime, rand(minimum_growtime, maximum_growtime))

	//start processing
	START_PROCESSING(SSobj, src)

/obj/structure/corruption/node/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/structure/corruption/node/process()
	//we need to have a cooldown, so check and then add
	if(!COOLDOWN_FINISHED(src, growtime))
		return
	COOLDOWN_START(src, growtime, rand(minimum_growtime, maximum_growtime))
	//attempt to grow all weeds in range
	for(var/obj/structure/corruption/growing_weed in range(node_range, src))
		growing_weed.try_expand()

/obj/structure/corruption/node/update_icon()
	return icon_state = "corruption-infector"//No icon randomization at init. The node's icon is already well defined.

/obj/structure/corruption/node/harvester/update_icon()
	return icon_state = "harvester"