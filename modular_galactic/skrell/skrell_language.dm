///////////////////////////////////////////////////
//          Skrell lang and lang holder          //
///////////////////////////////////////////////////

/datum/language/skrell
	name = "Skrellian"
	desc = "The language of the skrells. A bunch of warbling and musical tone."
	space_chance = 100
	flags = TONGUELESS_SPEECH
	key = "K"
	syllables = list("qr","qrr","xuq","qil","quum","xuqm","vol","xrim","zaoo","qu-uu","qix","qoo","zix","*","!")
	default_priority = 90
	icon = 'modular_galactic/skrell/skrell.dmi'
	icon_state = "skrell"


/datum/language_holder/skrell
	understood_languages = list(
		/datum/language/common = list(LANGUAGE_ATOM),
		/datum/language/skrell = list(LANGUAGE_ATOM),
		/datum/language/slime = list(LANGUAGE_ATOM)
	)

	spoken_languages = list(
		/datum/language/common = list(LANGUAGE_ATOM),
		/datum/language/skrell = list(LANGUAGE_ATOM),
		/datum/language/slime = list(LANGUAGE_ATOM)
	)

