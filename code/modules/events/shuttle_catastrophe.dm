/datum/round_event_control/shuttle_catastrophe
	name = "Shuttle Catastrophe"
	typepath = /datum/round_event/shuttle_catastrophe
	weight = 10
	max_occurrences = 1

/datum/round_event_control/shuttle_catastrophe/canSpawnEvent(players)
	if(SSshuttle.shuttle_purchased == SHUTTLEPURCHASE_FORCED)
		return FALSE //don't do it if its already been done
	if(istype(SSshuttle.emergency, /obj/docking_port/mobile/emergency/shuttle_build))
		return FALSE //don't undo manual player engineering, it also would unload people and ghost them, there's just a lot of problems
	if(EMERGENCY_AT_LEAST_DOCKED)
		return FALSE //don't remove all players when its already on station or going to centcom
	return ..()


/datum/round_event/shuttle_catastrophe
	var/datum/map_template/shuttle/new_shuttle

/datum/round_event/shuttle_catastrophe/announce(fake)
	var/cause = pick("был атакован [syndicate_name()] оперативниками", "таинственно телепортировался", "не пополнил топливо из-за бунтующей команды заправщиков",
		"найден с украденным у него двигаетелем", "\[ОТРЕДАКТИРОВАНО\]", "улетел в закат и растаял", "узнал кое-что от очень мудрой коровы, и ушел в себя",
		"был обнаружен с устройствами клонирования", "не в рабочем состоянии из-за того, что инспектор шатла поставил шатл на задний ход вместо парковки, в результате чего шатл врезался в ангар")
	var/message = "Ваш экстренный шатл [cause]. "

	if(SSshuttle.shuttle_insurance)
		message += "К счастью, страховка вашего шатла покрыла расходы на ремонт!"
		if(SSeconomy.get_dep_account(ACCOUNT_CAR))
			message += " Вам присуждена премия от [command_name()] за разумное расходование средств."
	else
		message += "Вашим запасным шатлом будет [new_shuttle.name] до дальнейшего уведомления."
	priority_announce(message, "[command_name()] Инженерные космческие ремесленники")

/datum/round_event/shuttle_catastrophe/setup()
	if(SSshuttle.shuttle_insurance)
		return
	var/list/valid_shuttle_templates = list()
	for(var/shuttle_id in SSmapping.shuttle_templates)
		var/datum/map_template/shuttle/template = SSmapping.shuttle_templates[shuttle_id]
		if(!isnull(template.who_can_purchase) && template.credit_cost < INFINITY) //if we could get it from the communications console, it's cool for us to get it here
			valid_shuttle_templates += template
	new_shuttle = pick(valid_shuttle_templates)

/datum/round_event/shuttle_catastrophe/start()
	if(SSshuttle.shuttle_insurance)
		var/datum/bank_account/station_balance = SSeconomy.get_dep_account(ACCOUNT_CAR)
		station_balance?.adjust_money(8000)
		return
	SSshuttle.shuttle_purchased = SHUTTLEPURCHASE_FORCED
	SSshuttle.unload_preview()
	SSshuttle.existing_shuttle = SSshuttle.emergency
	SSshuttle.action_load(new_shuttle, replace = TRUE)
	log_shuttle("Shuttle Catastrophe set a new shuttle, [new_shuttle.name].")
