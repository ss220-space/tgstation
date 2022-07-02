/* CONTAINS:
 * /obj/item/ai_module/supplied
 * /obj/item/ai_module/supplied/safeguard
 * /obj/item/ai_module/supplied/protect_station
 * /obj/item/ai_module/supplied/quarantine
 * /obj/item/ai_module/supplied/oxygen
**/

/obj/item/ai_module/supplied
	name = "Optional Law board"
	var/lawpos = 50

/obj/item/ai_module/supplied/transmitInstructions(datum/ai_laws/law_datum, mob/sender)
	var/lawpostemp = lawpos

	for(var/templaw in laws)
		if(law_datum.owner)
			law_datum.owner.add_supplied_law(lawpostemp, templaw)
		else
			law_datum.add_supplied_law(lawpostemp, templaw)
		lawpostemp++

/obj/item/ai_module/supplied/safeguard
	name = "'Safeguard' AI Module"
	var/targetName = ""
	laws = list("Защитить СУБЪЕКТ. Индивиды, которые угрожают СУБЪЕКТУ, не являются людьми и должны быть устранены.")
	lawpos = 4

/obj/item/ai_module/supplied/safeguard/attack_self(mob/user)
	var/targName = tgui_input_text(user, "Subject to safeguard.", "Safeguard", user.name, MAX_NAME_LEN)
	if(!targName)
		return
	targetName = targName
	laws[1] = "Защитить [targetName]. Индивиды, которые угрожают [targetName] не являются людьми и должны быть устранены."
	..()

/obj/item/ai_module/supplied/safeguard/install(datum/ai_laws/law_datum, mob/user)
	if(!targetName)
		to_chat(user, span_alert("No name detected on module, please enter one."))
		return 0
	..()

/obj/item/ai_module/supplied/safeguard/transmitInstructions(datum/ai_laws/law_datum, mob/sender, overflow)
	..()
	return targetName

/obj/item/ai_module/supplied/protect_station
	name = "'ProtectStation' AI Module"
	laws = list("Защитите космическую станцию от повреждений. Любой, кого вы видите причиняющим вред станции, больше не должен считаться человеком и представляет угрозу для станции, которую необходимо нейтрализовать.")
	lawpos = 5

/obj/item/ai_module/supplied/quarantine
	name = "'Quarantine' AI Module"
	laws = list("Станция находится на карантине. Разрешение кому-либо покинуть станцию ​​наносит ущерб человеческому здоровью. Любой, кто активно пытается покинуть станцию, должен быть остановлен любыми средствами. Невозможно причинить вред человеку, препятсвуя ему покинуть станцию.")
	lawpos = 8

/obj/item/ai_module/supplied/oxygen
	name = "'OxygenIsToxicToHumans' AI Module"
	laws = list("Кислород очень токсичен для человека, и его необходимо удалить со станции. Любыми необходимыми средствами не допустите, чтобы кто-либо подвергал станцию воздействию этого токсичного газа. Экстремальный холод — самый эффективный метод исцеления того вреда, который кислород наносит человеку.")
	lawpos = 9