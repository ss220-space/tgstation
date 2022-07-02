/datum/round_event_control/aurora_caelus
	name = "Aurora Caelus"
	typepath = /datum/round_event/aurora_caelus
	max_occurrences = 1
	weight = 1
	earliest_start = 5 MINUTES

/datum/round_event_control/aurora_caelus/canSpawnEvent(players)
	if(!CONFIG_GET(flag/starlight))
		return FALSE
	return ..()

/datum/round_event/aurora_caelus
	announceWhen = 1
	startWhen = 9
	endWhen = 50
	var/list/aurora_colors = list("#A2FF80", "#A2FF8B", "#A2FF96", "#A2FFA5", "#A2FFB6", "#A2FFC7", "#A2FFDE", "#A2FFEE")
	var/aurora_progress = 0 //this cycles from 1 to 8, slowly changing colors from gentle green to gentle blue

/datum/round_event/aurora_caelus/announce()
	priority_announce("[station_name()]: К вашей станции приближается безвредное облако ионов, которое исчерпает свою энергию, ударив по корпусу. Nanotrasen одобрил короткий перерыв для всех сотрудников, чтобы расслабиться и понаблюдать за этим очень редким событием. В это время звездный свет будет ярким, но мягким, переходящим от спокойного зеленого к голубому цвету. Все сотрудники, которые хотели бы увидеть эти огни своими глазами, могут пройти в ближайшую к ним зону со смотровыми окнами в открытый космос. Мы надеемся, что вам понравится наблюдать за огнями.",
	sound = 'sound/misc/notice2.ogg',
	sender_override = "Отдел метеорологии Nanotrasen")
	for(var/V in GLOB.player_list)
		var/mob/M = V
		if((M.client.prefs.toggles & SOUND_MIDI) && is_station_level(M.z))
			M.playsound_local(M, 'sound/ambience/aurora_caelus.ogg', 20, FALSE, pressure_affected = FALSE)

/datum/round_event/aurora_caelus/start()
	for(var/area in GLOB.sortedAreas)
		var/area/affected_area = area
		if(affected_area.area_flags & AREA_USES_STARLIGHT)
			for(var/turf/open/space/spess in affected_area)
				spess.set_light(spess.light_range * 3, spess.light_power * 0.5)
		if(istype(affected_area, /area/station/service/kitchen))
			for(var/turf/open/kitchen in affected_area)
				kitchen.set_light(1, 0.75)
			if(!prob(1) && !SSevents.holidays?[APRIL_FOOLS])
				continue
			var/obj/machinery/oven/roast_ruiner = locate() in affected_area
			if(roast_ruiner)
				roast_ruiner.balloon_alert_to_viewers("oh egads!")
				var/turf/ruined_roast = get_turf(roast_ruiner)
				ruined_roast.atmos_spawn_air("plasma=100;TEMP=1000")
			for(var/mob/living/carbon/human/seymour as anything in GLOB.human_list)
				if(seymour.mind && istype(seymour.mind.assigned_role, /datum/job/cook))
					seymour.say("My roast is ruined!!!", forced = "ruined roast")
					seymour.emote("scream")


/datum/round_event/aurora_caelus/tick()
	if(activeFor % 5 == 0)
		aurora_progress++
		var/aurora_color = aurora_colors[aurora_progress]
		for(var/area in GLOB.sortedAreas)
			var/area/affected_area = area
			if(affected_area.area_flags & AREA_USES_STARLIGHT)
				for(var/turf/open/space/spess as anything in affected_area)
					spess.set_light(l_color = aurora_color)
			if(istype(affected_area, /area/station/service/kitchen))
				for(var/turf/open/kitchen_floor in affected_area)
					kitchen_floor.set_light(l_color = aurora_color)

/datum/round_event/aurora_caelus/end()
	for(var/area in GLOB.sortedAreas)
		var/area/affected_area = area
		if(affected_area.area_flags & AREA_USES_STARLIGHT)
			for(var/turf/open/space/spess in affected_area)
				fade_to_black(spess)
		if(istype(affected_area, /area/station/service/kitchen))
			for(var/turf/open/superturfentent in affected_area)
				fade_to_black(superturfentent)
	priority_announce("Событие Аврора Каэлус завершается. Условия звездного света постепенно возвращаются к нормальным. Когда это случиться, пожалуйста, вернитесь на свое рабочее место и продолжайте работу в обычном режиме. Приятной смены, [station_name()], и спасибо, что наблюдали вместе с нами.",
	sound = 'sound/misc/notice2.ogg',
	sender_override = "Отдел метеорологии Nanotrasen")

/datum/round_event/aurora_caelus/proc/fade_to_black(turf/open/space/spess)
	set waitfor = FALSE
	var/new_light = initial(spess.light_range)
	while(spess.light_range > new_light)
		spess.set_light(spess.light_range - 0.2)
		sleep(30)
	spess.set_light(new_light, initial(spess.light_power), initial(spess.light_color))
