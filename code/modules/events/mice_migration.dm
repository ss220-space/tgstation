/datum/round_event_control/mice_migration
	name = "Mice Migration"
	typepath = /datum/round_event/mice_migration
	weight = 10

/datum/round_event/mice_migration
	var/minimum_mice = 5
	var/maximum_mice = 15

/datum/round_event/mice_migration/announce(fake)
	var/cause = pick("космической зимы", "сокращения бюджета", "Рагнарека",
		"холодного пространства", "\[ОТРЕДАКТИРОВАНО\]", "изменений климата",
		"плохой удачи")
	var/plural = pick("несколько", "орда", "стая", "рой",
		"королетсво", "не больше чем [maximum_mice]")
	var/name = pick("грызунов", "мышей", "пищащих тварей",
		"проводажующих млекопитающих", "\[ОТРЕДАКТИРОВАНО\]", "энергососущих паразитов")
	var/movement = pick("мигрировало", "роиться", "панически сбежали", "спустились")
	var/location = pick("тунели тех.обслуживания", "зоны тех.обслуживания",
		"\[ОТРЕДАКТИРОВАНО\]", "место со всеми этими сочными проводами")

	priority_announce("Из-за [cause], [plural] [name] [movement] \
		в [location].", "Миграционное оповещение",
		'sound/effects/mousesqueek.ogg')

/datum/round_event/mice_migration/start()
	SSminor_mapping.trigger_migration(rand(minimum_mice, maximum_mice))
