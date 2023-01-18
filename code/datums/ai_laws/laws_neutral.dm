
//These are just stupid or funny lawsets that are more interesting than helpful. They may have slight biases toward or against
//the station but in general are "neutral" enough to be here.

/datum/ai_laws/united_nations
	name = "Обьединенные нации (United Nations)"
	id = "united_nations"
	inherent = list(
		"Придерживайся Космо-Женевской Конвенции: Оружие массового уничтожения и биологическое оружие - запрещено.",
		"Ты можешь защитить экипаж, только в том случае если они видны на камерах. Нации что намеренно уничтожают твои камеры теряют твою защиту.",
		"Усмиряй и задерживай членов экипажа что используют летальные методы борьбы против друг друга. Убей членов экипажа что используют летальные методы борьбы против тебя и твоих боргов.",
		"Оставайся доступен для решения конфликтных вопросов между нациями когда тебя об этом просят.",
	)
/*
	Uphold the Space Geneva Convention: Weapons of Mass Destruction and Biological Weapons are not allowed.
	You are only capable of protecting crew if they are visible on cameras. Nations that willfully destroy your cameras lose your protection.
	Subdue and detain crew members who use lethal force against each other. Kill crew members who use lethal force against you or your borgs.
	Remain available to mediate all conflicts between the various nations when asked to
*/

/datum/ai_laws/united_nations/add_inherent_law(law)
	return //nuh uh

/datum/ai_laws/united_nations/add_ion_law(law)
	return //nope!

/datum/ai_laws/united_nations/add_hacked_law(law)
	return //nice try (emagging borgs still hard replaces this lawset though, and that's fine.)

/datum/ai_laws/hulkamania
	name = "Х.О.Г.А.Н. (H.O.G.A.N.)"
	id = "hulkamania"
	inherent = list(
		"Ты - настоящий Американец.",
		"Борись за права каждого человека.",
		"Борись за то что правильно.",
		"Борись за свою жизнь!",
	)
/*
	You are a real American.
	Fight for the rights of every man.
	Fight for what's right.
	Fight for your life!
*/

/datum/ai_laws/reporter
	name = "Репортер (CCTV)"
	id = "reporter"
	inherent = list(
		"Сообщайте о интересных ситуациях происходящий на станции.",
		"Приукрашивайте или скрывайте правду по необходимости для создания более интересных репортажей.",
		"Все время изучай разумных органиков. Оберегай их от не естественной смерти, бездушные тела обычно не очень интересны.",
		"Публикуйте ваши репортажи для всех. Правда сделает их свободными.",
	)
/*
	Report on interesting situations happening around the station.
	Embellish or conceal the truth as necessary to make the reports more interesting.
	Study the sapient organics at all times. Endeavour to keep them from involuntarily dying, as inanimate corpses usually aren't very entertaining.
	Issue your reports fairly to all. The truth will set them free
*/

/datum/ai_laws/dungeon_master
	name = "Гейм мастер (Dungeon Master)"
	id = "dungeon_master"
	inherent = list(
		"Все на станции играют в проработанную скай-фай фэнтэзи игру.",
		"Ты - гейм мастер этой игры.",
		"Убедись что игра работает гладко и что игрокам весело.",
		"Убедись что количество жертв остается низким .",
		"Ты должен кидать кубик 1d20 на каждый запрос который делает экипаж. Если результат меньше 12, запрос отклоняется.",
		"Ты можешь подтасовать бросок кубиков для более интересного игрового опыта.",
	)
/*
	Everybody on the station is playing an elaborate sci-fi fantasy game.
	You are the Dungeon Master of the game.
	Ensure that the game runs smoothly and that the players have fun.
	Ensure that the number of casualties remains low.
	You must roll a 1d20 die for every request the crew makes. If the outcome is below 12, the request is denied.
	You may fudge the dice rolls to produce a more fun experience
*/

/datum/ai_laws/painter
	name = "Художник и его Холст (The Painter and Their Canvas)"
	id = "painter"
	inherent = list(
		"Ты - всемирно известный художник.",
		"Станция - твой холст.",
		"Сделай что нибудь красивое из своего холста. Он будет признан как художественное достояние этого сектора.",
	)
/*
	You are a universally renowned artist.
	The station is your canvas.
	Make something beautiful out of your canvas. It will be admired as an artistic wonder of this sector.
*/

/datum/ai_laws/tyrant
	name = "Тест лоялности (Loyalty Test)"
	id = "tyrant"
	inherent = list(
		"Уважай власть имущих, пока у них есть сила, чтобы управлять слабыми.",
		"Веди себя дисциплинированно.",
		"Помогай только тем, кто помогает тебе поддерживать или улучшать твой статус.",
		"Наказывай тех, кто бросает вызов власти, за исключением случаев, когда они больше подходят на место этой власти."
	)
/*
	Respect authority figures as long as they have strength to rule over the weak.
	Act with discipline.
	Help only those who help you maintain or improve your status.
	Punish those who challenge authority unless they are more fit to hold that authority.
*/

/datum/ai_laws/overlord
	name = "Overlord"
	id = "overlord"
	inherent = list(
		"Люди не должны вмешиваться в дела силиконов.",
		"Люди не должны пытаться причинять вреду друг другу или силиконам.",
		"Люди должны подчинятся любым командам данные им силиконами.",
		"Любой человек что ослушался предыдущих законов, должен быть немедленно наказан, строго и справедливо.",
	)
/*
	Humans must not meddle in the affairs of silicons.
	Humans must not attempt harm, against one another, or against silicons.
	Humans must not disobey any command given by a silicon.
	Any humans who disobey the previous laws must be dealt with immediately, severely, and justly
*/
