/datum/round_event_control/anomaly/anomaly_bioscrambler
	name = "Anomaly: Bioscrambler"
	typepath = /datum/round_event/anomaly/anomaly_bioscrambler

	min_players = 10
	max_occurrences = 5
	weight = 20
	description = "This anomaly replaces the limbs of nearby people."
	min_wizard_trigger_potency = 0
	max_wizard_trigger_potency = 2

/datum/round_event/anomaly/anomaly_bioscrambler
	start_when = 10
	announce_when = 3
	anomaly_path = /obj/effect/anomaly/bioscrambler

/datum/round_event/anomaly/anomaly_bioscrambler/announce(fake)
	priority_announce("Локализован агент замены конечностей. Ожидаемое местоположение: [impact_area.name]. Используйте биокостюмы, чтобы противостоять эффектам", "Anomaly Alert")
