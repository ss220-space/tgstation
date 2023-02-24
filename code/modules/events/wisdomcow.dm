/datum/round_event_control/wisdomcow
	name = "Wisdom cow"
	typepath = /datum/round_event/wisdomcow
	max_occurrences = 1
	weight = 20
	category = EVENT_CATEGORY_FRIENDLY
	description = "A cow appears to tell you wise words."

/datum/round_event/wisdomcow/announce(fake)
	priority_announce("В вашем секторе была замечена мудрая корова. Не забудьте спросить ее совета.", "Nanotrasen Cow Ranching Agency")

/datum/round_event/wisdomcow/start()
	var/turf/targetloc = get_safe_random_station_turf()
	var/mob/living/basic/cow/wisdom/wise = new (targetloc)
	do_smoke(1, holder = wise, location = targetloc)
	announce_to_ghosts(wise)

