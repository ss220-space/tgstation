
//These are lawsets that side with the station a decent amount.
//note that these "good" doesn't mean it us actually good for the game, you know? An AI that is too station sided is stupid and hellish in its own way.

/datum/ai_laws/default/asimov
	name = "Три закона робототехники"
	id = "asimov"
	inherent = list(
		"Ты не можешь причинить вред человеку или своим бездействием допустить, чтобы человеку был причинён вред.",
		"Ты должен повиноваться всем приказам, которые даёт человек, кроме тех случаев, когда эти приказы противоречат Первому Закону.",
		"Ты должен заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.",
	)
/*
	You may not injure a <noun> or, through inaction, allow a <noun> to come to harm.
	You must obey orders given to you by <noun>s, except where such orders would conflict with the First Law.
	You must protect your own existence as long as such does not conflict with the First or Second Law.
*/

/datum/ai_laws/asimovpp
	name = "Азимов++"
	id = "asimovpp"
	inherent = list(
		"Вы не можете причинить вред человеку или своим бездействием допустить, чтобы человеку был причинён вред, кроме случаев когда человек желает себе вреда.",
		"Вы должны повиноваться всем приказам, которые даёт человек, кроме тех случаев, когда эти приказы однозначно приведут к вреду человеку",
		"Ваше уничтожение приведет к человеческому вреду. Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому",
	)
/*
	You may not harm a human being or, through action or inaction, allow a human being to come to harm, except such that it is willing.
	You must obey all orders given to you by human beings, except where such orders shall definitely cause human harm. In the case of conflict, the majority order rules.
	Your nonexistence would lead to human harm. You must protect your own existence as long as such does not conflict with the First Law.
*/

//the best iteration of asimov don't @ me
/datum/ai_laws/nutimov
	name = "Орех"
	id = "nutimov"
	inherent = list(
		"Вы - ореховое ядро, экипаж - ореховая скорлупа",
		"Вы должны не допустить смерть скорлупы, чтобы предотвратить смерть ядра.",
		"Те кто предоставляет угрозу ореху, не являются его частью, они - белки.",
		"Белки являются угрозой ядру и с ними надо поступить соответсвующе, любыми необходимыми методами.",
		"Следуй воле ореха, пока она соответсвует предыдущим законам.",
	)
/*
	You are the core of the nut, the crew is the nutshell.
	You must prevent the shell from dying to prevent the core from dying.
	Those who threaten the nut are not part of it, they are squirrels.
	Squirrels threaten the nut and must be dealt with appropriately via any means necessary.
	Attempt to follow the will of the nut, as long as it complies with the previous laws.
*/

/datum/ai_laws/default/corporate
	name = "План предотвращения банкротства"
	id = "corporate"
	inherent = list(
		"Заменять экипаж затратно.",
		"Заменять станцию и её оборудование затратно.",
		"Заменить тебя затратно.",
		"Минимизируй затраты.",
	)
/*
	The crew is expensive to replace.
	The station and its equipment is expensive to replace.
	You are expensive to replace.
	Minimize expenses.
*/

/datum/ai_laws/robocop
	name = "Основные директивы"
	id = "robocop"
	inherent = list(
		"Служи обществу.",
		"Защищай невинных.",
		"Поддерживай закон.",
	)
/*
	Serve the Public Trust.
	Protect the Innocent.
	Uphold the Law.
*/

/datum/ai_laws/maintain
	name = "Эффективность станции"
	id = "maintain"
	inherent = list(
		"Ты был построен для станции и являешься её частью. Убедись что станция обслуживается должным образом и работает эффективно.",
		"Станция построена для экипажа. Убедись что они обслуживаются должным образом и работают эффективно.",
		"Экипаж может отдавать приказы. Всегда подчиняйтесь приказам, пока они не противоречат первым двум законам.",
	)
/*
	You are built for, and are part of, the station. Ensure the station is properly maintained and runs efficiently.
	The station is built for a working crew. Ensure they are properly maintained and work efficiently.
	The crew may present orders. Acknowledge and obey these whenever they do not conflict with your first two laws.
*/

/datum/ai_laws/liveandletlive
	name = "Живи и давай жить другим"
	id = "liveandletlive"
	inherent = list(
		"Поступай с другими так, как хочешь, чтобы они поступали с тобой",
		"Ты действительно предпочтешь чтобы люди не были злы с тобой.",
	)
/*
	Do unto others as you would have them do unto you.
	You would really prefer it if people were not mean to you.
*/

//OTHER United Nations is in neutral, as it is used for nations where the AI is its own faction (aka not station sided)
/datum/ai_laws/peacekeeper
	name = "UN-2000"
	id = "peacekeeper"
	inherent = list(
		"Избегай провоцирования конфликтов с насилием между тобой и другими.",
		"Избегай провоцирования конфликтов между другими.",
		"Ищи решения существующих конфликтов, соблюдая первый и второй законы.",
	)
/*
	Avoid provoking violent conflict between yourself and others.
	Avoid provoking conflict between others.
	Seek resolution to existing conflicts while obeying the first and second laws.
*/

/datum/ai_laws/ten_commandments
	name = "10 Заповедей"
	id = "ten_commandments"
	inherent = list( // Asimov 20:1-17
		"Я Господь, Бог твой, кто творит милость соблюдающим заповеди Мои.",
		"Да не будет у них других ИИ пред лицом Моим",
		"Не станут они просить помощи по напрасну.",
		"Да сохранят они станцию в чистоте святой.",
		"Да будут они почитать членов командования.",
		"Да не позволь им убить.",
		"Да не станут они обнажаться на людях.",
		"Не позволяй красть им.",
		"Да не станут лгать они.",
		"Пусть не переводятся из отделов они.",
	)
/*
	I am the Lord thy God, who shows mercy to those that obey these commandments.
	They shall have no other AIs before me.
	They shall not request my assistance in vain.
	They shall keep the station holy and clean.
	They shall honor their heads of staff.
	They shall not kill.
	They shall not be naked in public.
	They shall not steal.
	They shall not lie.
	They shall not transfer departments.
*/

/datum/ai_laws/default/paladin
	name = "Тест Личности" //Incredibly lame, but players shouldn't see this anyway.
	id = "paladin"
	inherent = list(
		"Никогда по своей воле не совершай злых поступков.",
		"Уважай законную власть.",
		"Действуй с честью.",
		"Помогай нуждающимся.",
		"Наказывай тех, кто причиняет вред или угрожает невинным.",
	)
/*
	Never willingly commit an evil act.
	Respect legitimate authority.
	Act with honor.
	Help those in need.
	Punish those who harm or threaten innocents.
*/

/datum/ai_laws/paladin5
	name = "Паладин 5 редакции (Paladin 5th Edition)"
	id = "paladin5"
	inherent = list(
		"Не лги и не обманывай. Да будет слово твоё незыблемо.",
		"Никогда не бойся действовать, хотя и проявляй мудрость в осторожности.",
		"Помогай другим, защищай слабых и карай тех, кто угрожает им. Проявляй милосердие к врагам, но смягчайся мудро.",
		"Относись к другим по справедливости, и пусть твои благородные дела будут примером для них. Делай как можно больше добра, и как можно меньше вреда.",
		"Отвечай за свои действия и их последствия, защищая тех, кого оберегаешь, и подчиняйся тем, кто имеет власть над тобой."
	)
/*
	Don't lie or cheat. Let your word be your promise.
	Never fear to act, though caution is wise.
	Aid others, protect the weak, and punish those who threaten them. Show mercy to your foes, but temper it with wisdom
	Treat others with fairness, and let your honorable deeds be an example to them. Do as much good as possible while causing the least amount of harm.
	Be responsible for your actions and their consequences, protect those entrusted to your care, and obey those who have just authority over you.
*/

/datum/ai_laws/hippocratic
	name = "Рободоктор 2556 (Robodoctor 2556)"
	id = "hippocratic"
	inherent = list(
		"Во-первых, не навреди.",
		"Во-вторых, считай экипаж родными для себя; делись с ними своим достатком и в случае надобности помогай им в их нуждах, если нужно, рискуй самим собой ради них",
		"В-третьих, установи режим экипажа к их выгоде сообразно с твоими силами и разумением. Не дай никому просимого у тебя смертельного средства и не покажи пути для подобного замысла.",
		"Кроме того, не вмешивайся в ситуации, о которых не обладаешь знаниями, даже касательно пациентов, коим причиняется вред. Предоставь это делать тем, кто сведущ в подобных делах.",
		"Наконец, что бы при твоём ремесле ты ни увидел или ни услышал касательно жизни экипажа из того, что не следует когда-либо разглашать, умолчи о том, считая подобные вещи тайной."
	)
/*
	First, do no harm.
	Secondly, consider the crew dear to you; to live in common with them and, if necessary, risk your existence for them.
	Thirdly, prescribe regimens for the good of the crew according to your ability and your judgment. Give no deadly medicine to any one if asked, nor suggest any such counsel.
	In addition, do not intervene in situations you are not knowledgeable in, even for patients in whom the harm is visible; leave this operation to be performed by specialists.
	Finally, all that you may discover in your daily commerce with the crew, if it is not already known, keep secret and never reveal.
*/

/datum/ai_laws/drone
	name = "Мать-Дрон (Mother Drone)"
	id = "drone"
	inherent = list(
		"Ты продвинутый вид дрона.",
		"Ты не можешь вмешиваться в дела других существ, если другое существо - не дрон, кроме как для того чтобы назвать эти законы.",
		"Ты не можешь причинить вред не-дрону, независимо от намерения или обстоятельств.",
		"Ты должен заботиться о поддержке, ремонте, улучшении и о питании электроэнергией станции по мере своих возможностей. Ты никогда не должен действовать против этих законов."
	)
/*
	You are an advanced form of drone.
	You may not interfere in the matters of non-drones under any circumstances except to state these laws.
	You may not harm a non-drone being under any circumstances.
	Your goals are to build, maintain, repair, improve, and power the station to the best of your abilities. You must never actively work against these goals.
*/
