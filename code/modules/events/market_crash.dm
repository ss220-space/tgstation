/**
 * An event which decreases the station target temporarily, causing the inflation var to increase heavily.
 *
 * Done by decreasing the station_target by a high value per crew member, resulting in the station total being much higher than the target, and causing artificial inflation.
 */
/datum/round_event_control/market_crash
	name = "Market Crash"
	typepath = /datum/round_event/market_crash
	weight = 10

/datum/round_event/market_crash
	var/market_dip = 0

/datum/round_event/market_crash/setup()
	startWhen = 1
	endWhen = rand(25, 50)
	announceWhen = 2

/datum/round_event/market_crash/announce(fake)
	var/list/poss_reasons = list("выравниванием луны и солнца",\
		"некоторым рискованным результатам на рынке жилья",\
		"безвременным падением команды B.E.P.I.S.",\
		"спекулятивными грантами Terragov, дающими обратный эффект",\
		"сильно преувеличенными сообщениями о массовых самоубийствах сотрудников бухгалтерии Nanotrasen")
	var/reason = pick(poss_reasons)
	priority_announce("В связи с [reason], цены в автоматах на станции будут повышены на короткий период.", "Отдел бухгалтерии Nanotrasen")

/datum/round_event/market_crash/start()
	. = ..()
	market_dip = rand(1000,10000) * length(SSeconomy.bank_accounts_by_id)
	SSeconomy.station_target = max(SSeconomy.station_target - market_dip, 1)
	SSeconomy.price_update()
	ADD_TRAIT(SSeconomy, TRAIT_MARKET_CRASHING, MARKET_CRASH_EVENT_TRAIT)

/datum/round_event/market_crash/end()
	. = ..()
	SSeconomy.station_target += market_dip
	REMOVE_TRAIT(SSeconomy, TRAIT_MARKET_CRASHING, MARKET_CRASH_EVENT_TRAIT)
	SSeconomy.price_update()
	priority_announce("Цены в атоматах на станции теперь стабилизировались.", "Отдел бухгалтерии Nanotrasen")

