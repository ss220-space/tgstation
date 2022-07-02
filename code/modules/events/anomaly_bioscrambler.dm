/datum/round_event_control/anomaly/anomaly_bioscrambler
	name = "Anomaly: Bioscrambler"
	typepath = /datum/round_event/anomaly/anomaly_bioscrambler

	min_players = 10
	max_occurrences = 5
	weight = 20

/datum/round_event/anomaly/anomaly_bioscrambler
	startWhen = 10
	announceWhen = 3
	anomaly_path = /obj/effect/anomaly/bioscrambler

/datum/round_event/anomaly/anomaly_bioscrambler/announce(fake)
	priority_announce("Локализован компонент по замене конечностей. Ожидаемое местоположение: [impact_area.name]. Носите биокостюмы, чтобы противостоять воздействию. Расчетный период полураспада %9£$T$%F3 года", "Оповещение об аномалии")
