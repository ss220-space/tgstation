/datum/round_event_control/gravity_generator_blackout
	name = "Gravity Generator Blackout"
	typepath = /datum/round_event/gravity_generator_blackout
	weight = 30

/datum/round_event_control/gravity_generator_blackout/canSpawnEvent()
	var/station_generator_exists = FALSE
	for(var/obj/machinery/gravity_generator/main/the_generator in GLOB.machines)
		if(is_station_level(the_generator.z))
			station_generator_exists = TRUE

	if(!station_generator_exists)
		return FALSE

/datum/round_event/gravity_generator_blackout
	announceWhen = 1
	startWhen = 1
	announceChance = 33

/datum/round_event/gravity_generator_blackout/announce(fake)
	priority_announce("Гравиносферные аномалии обнаружены вблизи [station_name()]. Требуется ручная перезагрузка генераторов.", "Оповещение об аномалии", ANNOUNCER_GRANOMALIES)

/datum/round_event/gravity_generator_blackout/start()
	for(var/obj/machinery/gravity_generator/main/the_generator in GLOB.machines)
		if(is_station_level(the_generator.z))
			the_generator.blackout()
