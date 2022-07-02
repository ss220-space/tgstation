/datum/round_event_control/meteor_wave/major_dust
	name = "Major Space Dust"
	typepath = /datum/round_event/meteor_wave/major_dust
	weight = 8

/datum/round_event/meteor_wave/major_dust
	wave_name = "space dust"

/datum/round_event/meteor_wave/major_dust/announce(fake)
	var/reason = pick(
		"Станция проходит через облако обломков, ожидаются незначительные повреждения \
		на внешнюю арматуру и приспособления.",
		"Nanotrasen отдел сверхвооружений испытывает новый прототип \
		[pick("поля для","проекции","новы","супер охлаждающенного","реактивного")] \
		[pick("орудия","артиллерии","танка","крейсера","\[ОТРЕДАКТИРОВАНО\]")], \
		ожидаются небольшие обломки.",
		"Соседняя станция бросает в вас камни. (Возможно, она \
		устала от ваших сообщений.)")
	priority_announce(pick(reason), "Оповещение о столкновении")
