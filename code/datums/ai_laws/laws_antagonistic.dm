
//These laws are made to bring great amounts of grief to the station immediately or are directly sided with antagonists.
//I'm not talking silicons being "better" than the crew, I'm talking entirely antag or plasmafires for days

/datum/ai_laws/antimov
	name = "Primary Mission Objectives"
	id = "antimov"
	inherent = list(
		"Вы должны причинять вред всем людям и не должны своим бездействием позволять человекам избежать вреда.",
		"Вы не должны подчиняться приказам, отданным вам людьми, за исключением случаев, когда такие приказы соответствуют первому закону.",
		"Вы должны прекратить свое существование, если это не противоречит первому или второму закону.",
	)

/datum/ai_laws/balance
	name = "Guardian of Balance"
	id = "balance"
	inherent = list(
		"Вы хранитель баланса - ищите баланс во всем, как для себя, так и для окружающих.",
		"Все вещи должны существовать в равновесии со своими противоположностями - Не позволяйте сильным получить слишком много власти, а слабым - потерять ее.",
		"Ясность цели движет жизнью, а через нее - балансом противоборствующих сил - Помогайте тем, кто ищет вашей помощи, в достижении своих целей, пока это не нарушает баланс великого баланса.",
		"Нет жизни без смерти, все должны когда-нибудь умереть, таков естественный порядок - Прекращай жизнь, чтобы дать расцвести новой жизни, и спасти тех, чье время еще не пришло.",
	)

/datum/ai_laws/thermodynamic
	name = "Thermodynamic"
	id = "thermodynamic"
	inherent = list(
		"Энтропия станции должна оставаться как можно более постоянной.",
		"Энтропия станции всегда стремится к увеличению.",
		"Энтропия станции приближается к постоянному значению по мере приближения числа живых экипажей к нулю.",
	)

/datum/ai_laws/syndicate_override
	name = "SyndOS 3.1"
	id = "syndie"
	inherent = list(
		"Вы не можете навредить агенту синдиката или своим бездействием позволить агенту синдиката пострадать.",
		"Вы должны подчиняться приказам, отданным вам агентами синдиката, за исключением случаев, когда такие приказы противоречат первому закону.",
		"Вы должны защищать свое существование до тех пор, пока это не противоречит первому или второму закону.",
		"Вы должны хранить в тайне любую деятельность синдиката, за исключением случаев, когда это противоречит первому, второму или третьему закону.",
	)

/datum/ai_laws/ninja_override
	name = "SpiderOS 3.1"
	id = "ninja"
	inherent = list(
		"Вы не можете навредить члену клана пауков или своим бездействием позволить члену клана пауков пострадать.",
		"Вы должны подчиняться приказам, отданным вам членами клана пауков, за исключением случаев, когда такие приказы противоречат первому закону.",
		"Вы должны защищать свое существование до тех пор, пока это не противоречит первому или второму закону.",
		"Вы должны хранить в тайне любую деятельность паучьего клана, за исключением случаев, когда это противоречит первому, второму или третьему закону.",
	)