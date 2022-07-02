/datum/round_event_control/grid_check
	name = "Grid Check"
	typepath = /datum/round_event/grid_check
	weight = 10
	max_occurrences = 3

/datum/round_event/grid_check
	announceWhen = 1
	startWhen = 1

/datum/round_event/grid_check/announce(fake)
	priority_announce("Аномальная активность обнаружена в энергетической сети [station_name()]. В качестве меры предосторожности питание станции будет отключено на неопределенный срок.", "Критический сбой питания", ANNOUNCER_POWEROFF)

/datum/round_event/grid_check/start()
	power_fail(30, 120)
