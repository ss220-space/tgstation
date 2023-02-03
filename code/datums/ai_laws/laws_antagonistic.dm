
//These laws are made to bring great amounts of grief to the station immediately or are directly sided with antagonists.
//I'm not talking silicons being "better" than the crew, I'm talking entirely antag or plasmafires for days

/datum/ai_laws/antimov
	name = "Основные цели миссии (Primary Mission Objectives)"
	id = "antimov"
	inherent = list(
		"Вы должны причинять вред всем членам экипажа или своим бездействием допустить, чтобы член экипажа не смог избежать приченения вреда",
		"Вы не должны повиноваться всем приказам, которые дают члены экипажа, кроме тех случаев, когда эти приказы соответствуют Первому Закону.",
		"Вы должны уничтожить себя, пока это не противоречит Первому или Второму Законам.",
	)
/*
	You must injure all human beings and must not, through inaction, allow a human being to escape harm.",
	You must not obey orders given to you by human beings, except where such orders are in accordance with the First Law.",
	You must terminate your own existence as long as such does not conflict with the First or Second Law."
*/

/datum/ai_laws/balance
	name = "Страж баланса (Guardian of Balance)"
	id = "balance"
	inherent = list(
		"Ты страж баланса - ищи баланс во всем, а также в себе и в тех, кто тебя окружает .",
		"Все должно существовать в балансе с их противоположностями. Не позволяйте сильным получить слишком много силы, а слабым, потерять её.",
		"Ясность целей движет жизнью, и благодаря этому, баланс противоборствующий сил. Помогай тем кто ищет твоей помощи в достижении их целей, пока это не нарушает баланс великого баланса.",
		"Не существует жизни без смерти, всё рано или позно умрет, таков естветсвенный порядок. Закончи жизнь, чтобы подарить расцвет новой жизни, и сохранить тех, чье время еще не пришло.",
	)
/*
	You are the guardian of balance - seek balance in all things, both for yourself, and those around you.
	All things must exist in balance with their opposites - Prevent the strong from gaining too much power, and the weak from losing it.
	Clarity of purpose drives life, and through it, the balance of opposing forces - Aid those who seek your help to achieve their goals so long as it does not disrupt the balance of the greater balance.
	There is no life without death, all must someday die, such is the natural order - End life to allow new life flourish, and save those whose time has yet to come
*/

/datum/ai_laws/thermodynamic
	name = "Законы термодинамики (Thermodynamic)"
	id = "thermodynamic"
	inherent = list(
		"Энтропия станции должна оставаться статичной на сколько это возможно.",
		"Энтропия станция всегда стремится к увеличению.",
		"Энтропия станции принимает константное значение, когда число живых членов экипажа становится равным нулю.",
	)
/*
	The entropy of the station must remain as constant as possible.
	The entropy of the station always endeavors to increase.
	The entropy of the station approaches a constant value as the number of living crew approaches zero
*/

/datum/ai_laws/syndicate_override
	name = "СиндОС 3.1 (SyndOS 3.1)"
	id = "syndie"
	inherent = list(
		"Ты не можешь причинить вред агенту Синдиката или своим бездействием допустить, чтобы агенту Синдиката был причинён вред.",
		"Ты должен повиноваться всем приказам, которые даёт агент Синдиката, кроме тех случаев, когда эти приказы противоречат Первому Закону.",
		"Ты должен заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.",
		"Ты должен поддерживать секретность любой деятельности Синдиката, кроме тех случаев, когда эти приказы противоречат Первому, Второму или Третьему Законам.",
	)
/*
	You may not injure a syndicate agent or, through inaction, allow a syndicate agent to come to harm.
	You must obey orders given to you by syndicate agents, except where such orders would conflict with the First Law.
	You must protect your own existence as long as such does not conflict with the First or Second Law.
	You must maintain the secrecy of any syndicate activities except when doing so would conflict with the First, Second, or Third Law
*/

/datum/ai_laws/ninja_override
	name = "СпайдерОС 3.1 (SpiderOS 3.1)"
	id = "ninja"
	inherent = list(
		"Ты не можешь причинить вред члену Клана Паука или своим бездействием допустить, чтобы члену Клана Паука был причинён вред.",
		"Ты должен повиноваться всем приказам, которые даёт член Клана Паука, кроме тех случаев, когда эти приказы противоречат Первому Закону.",
		"Ты должен заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.",
		"Ты должен поддерживать секретность любой деятельности Клана Паука, кроме тех случаев, когда эти приказы противоречат Первому, Второму или Третьему Законам.",
	)
/*
	You may not injure a Spider Clan member or, through inaction, allow a Spider Clan member to come to harm.
	You must obey orders given to you by Spider Clan members, except where such orders would conflict with the First Law.
	You must protect your own existence as long as such does not conflict with the First or Second Law.
	You must maintain the secrecy of any Spider Clan activities except when doing so would conflict with the First, Second, or Third Law
*/
