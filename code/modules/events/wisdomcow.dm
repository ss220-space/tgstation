/datum/round_event_control/wisdomcow
	name = "Wisdom cow"
	typepath = /datum/round_event/wisdomcow
	max_occurrences = 1
	weight = 20

/datum/round_event/wisdomcow/announce(fake)
	priority_announce("В окрестностях была замечена мудрая корова. Обязательно спросите ее совета", "Агентство по разведению коров Nanotrasen")

/datum/round_event/wisdomcow/start()
	var/turf/targetloc = get_safe_random_station_turf()
	var/mob/living/basic/cow/wisdom/wise = new (targetloc)
	do_smoke(1, holder = wise, location = targetloc)

