//suit//

/obj/item/clothing/under/scp
	icon = 'icons/obj/scp/scp_clothes.dmi'
	worn_icon = 'icons/obj/scp/scp_clothes.dmi'
	can_adjust = FALSE

/obj/item/clothing/under/scp/dclass
	name = "D-Class uniform"
	desc = "A bright orange jumpsuit, indicative of Class D personnel."
	icon_state = "d_s"
	inhand_icon_state = null

/obj/item/clothing/under/scp/alpha
	name = "Alpha-1 uniform"
	desc = "A modified uniform made specificly for the MTF unit 'Red Right Hand'."
	icon_state = "alpha-uniform_s"
	armor = list(MELEE = 30, BULLET = 30, LASER = 10, ENERGY = 0, BOMB = 5, BIO = 0, FIRE = 50, ACID = 40)
	siemens_coefficient = 0.9

obj/item/clothing/under/scp/chaos
	name = "tactical sweatshirt"
	desc = "A white shirt for tactical operations.."
	icon_state = "tac_s"
	armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 10, ACID = 10)
	siemens_coefficient = 0.9

/obj/item/clothing/under/scp/whiteuniform_lcz
	name = "white security uniform LCZ"
	desc = "A sterile white uniform. Commonly issued to lower ranked security personnel"
	icon_state = "white_lcz_s"

/obj/item/clothing/under/scp/whiteuniform_hcz
	name = "white security uniform HCZ"
	desc = "A sterile white uniform. Commonly issued to higher ranked security personnel"
	icon_state = "white_hcz_s"

/obj/item/clothing/under/scp/whiteuniform_ez
	name = "white security uniform EZ"
	desc = "A sterile white uniform. Commonly used by office employers of SCP foundation"
	icon_state = "white_hcz_s"


//gloves//


/obj/item/clothing/gloves/scp
	icon = 'icons/obj/scp/scp_clothes.dmi'
	worn_icon = 'icons/obj/scp/scp_clothes.dmi'

/obj/item/clothing/gloves/scp/alpha_gloves
	name = "Alpha gloves"
	desc = "These grey tactical gloves are made from a durable synthetic, and have hardened knuckles."
	icon_state = "alpha-gloves"
	worn_icon_state = "alpha-gloves_s"
	siemens_coefficient = 0.50
	force = 5
	strip_delay = 80
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor = list(MELEE = 80, BULLET = 80, LASER = 60, ENERGY = 30, BOMB = 50, BIO = 50, FIRE = 80, ACID = 50, WOUND = 20)

/obj/item/clothing/gloves/scp/bad_gloves
	name = "Bad gloves"
	desc = "Bad gloves. Not for hugs"
	icon_state = "scpgloves"
	worn_icon_state = "scpgloves_s"
	siemens_coefficient = 0.5
	force = 5
	strip_delay = 80
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 5, BIO = 5, FIRE = 0, ACID = 5, WOUND = 0)

//mask//

/obj/item/clothing/mask/gas/scp
	icon = 'icons/obj/scp/scp_clothes.dmi'
	worn_icon = 'icons/obj/scp/scp_clothes.dmi'
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 5, BIO = 5, FIRE = 0, ACID = 5, WOUND = 0)

/obj/item/clothing/mask/gas/scp/mtf
	name = "MTF gasmask"
	desc = "A face-covering mask that can be connected to an air supply, this one is designed for MTF unit 'Red Right Hand'."
	icon_state = "alpha-mask"
	worn_icon_state = "alpha-mask_s"

/obj/item/clothing/mask/gas/scp/chaos
	name = "CI gasmask"
	desc = "Burning memory. Property of Chaos Insurgency."
	icon_state = "chaos-gasmask"
	worn_icon_state = "chaos-gasmask_s"

//helmet//

/obj/item/clothing/head/scp
	icon = 'icons/obj/scp/scp_clothes.dmi'
	worn_icon = 'icons/obj/scp/scp_clothes.dmi'

/obj/item/clothing/head/scp/mtf_beret
	name = "MTF Lieutenant beret"
	desc = "A dark red beret worn by members of the 'Red Right Hand' MTF unit, it feels kind of heavy for a beret."
	icon_state = "alpha-beret"
	worn_icon_state = "alpha-beret_s"
	armor = list(MELEE = 100, BULLET = 100, LASER = 90, ENERGY = 95, BOMB = 90, BIO = 90, FIRE = 50, ACID = 55, WOUND = 40)

/obj/item/clothing/head/scp/chaos_helmet
	name = "CI helmet"
	desc = "Brown helmet with chaos emblem. Property of Chaos Insurgency."
	icon_state = "chaos-helm"
	worn_icon_state = "chaos-helm_s"
	armor = list(MELEE = 40, BULLET = 85, LASER = 40, ENERGY = 25, BOMB = 30, BIO = 15, FIRE = 20, ACID = 15, WOUND = 20)

/obj/item/clothing/head/scp/can_open
	var/opened = FALSE
	var/helm_icon_state = ""

/obj/item/clothing/head/scp/can_open/dropped()
	icon_state = "[helm_icon_state]"
	opened = FALSE
	..()

/obj/item/clothing/head/scp/can_open/verb/closehelm()
	set category = "Object"
	set name = "Change helmet position"

	closehelmet(usr)


/obj/item/clothing/head/scp/can_open/AltClick(mob/user)
	..()
	if(user.can_perform_action(src, NEED_DEXTERITY))
		closehelmet(user)


/obj/item/clothing/head/scp/can_open/proc/closehelmet(mob/user)
	if(!user.incapacitated())
		opened = !opened
		if(opened)
			icon_state = "[helm_icon_state]_on"
			worn_icon_state = "[helm_icon_state]_s_on"
			to_chat(user, span_notice("You close your helmet."))
		else
			icon_state = "[helm_icon_state]"
			worn_icon_state = "[helm_icon_state]_s"
			to_chat(user, span_notice("You open your helmet. Fresh air."))
		usr.update_worn_head() //so our mob-overlays update

/obj/item/clothing/head/scp/can_open/examine(mob/user)
	. = ..()
	. += span_notice("Alt-click the helmet to change its position to [opened ? "opened" : "closed"].")

/obj/item/clothing/head/scp/mtf_tac_helmet
	name = "MTF tactical helmet"
	desc = "Orange tactical helmet"
	icon_state = "tac_helmet"
	worn_icon_state = "tac_helmet_s"

/obj/item/clothing/head/scp/beta
	name = "Beta helmet"
	desc = "Helmet with Beta emblem"
	icon_state = "beta-helmet"
	worn_icon_state = "beta-helmet_s"
	armor = list(MELEE = 90, BULLET = 70, LASER = 40, ENERGY = 25, bomb = 30, bio = 90, FIRE = 20, ACID = 15, WOUND = 20)

/obj/item/clothing/head/scp/mtf_heavy_helmet
	name = "MTF heavy helmet"
	desc = "This helmet can stop a bullet.Don't you believe it? Check it yourself."
	icon_state = "mtf-heavy-helmet"
	worn_icon_state = "mtf-heavy-helmet_s"
	armor = list(MELEE = 70, BULLET = 70, LASER = 70, ENERGY = 70, BOMB = 45, BIO = 15, FIRE = 30, ACID = 25, WOUND = 30)

/obj/item/clothing/head/scp/can_open/mtf_tactical_helmet
	name = "MTF tactical helmet"
	desc = "Helmet with MTF emblem and Night Vision Device"
	icon_state = "mtf-tactical-helmet"
	worn_icon_state = "mtf-tactical-helmet_s"
	helm_icon_state = "mtf-tactical-helmet"
	armor = list(MELEE = 70, BULLET = 70, LASER = 70, ENERGY = 70, BOMB = 45, BIO = 15, FIRE = 30, ACID = 25, WOUND = 30)

/obj/item/clothing/head/scp/can_open/eta
	name = "ETA helmet"
	desc = "Helmet with ETA emblem"
	icon_state = "eta-helmet"
	worn_icon_state = "eta-helmet_s"
	helm_icon_state = "eta-helmet"
	armor = list(MELEE = 70, BULLET = 70, LASER = 70, ENERGY = 70, BOMB = 45, BIO = 15, FIRE = 30, ACID = 25, WOUND = 30)


//Armor//

/obj/item/clothing/suit/armor/vest/scp
	icon = 'icons/obj/scp/scp_clothes.dmi'
	worn_icon = 'icons/obj/scp/scp_clothes.dmi'
	strip_delay = 80
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/suit/armor/vest/scp/chaos
	name = "CI armored vest"
	desc = "A synthetic armor vest. Property of Chaos Insurgency."
	icon_state = "chaos-armor"
	worn_icon_state = "chaos-armor_s"
	armor = list(MELEE = 40, BULLET = 85, LASER = 40, ENERGY = 25, BOMB = 30, BIO = 15, FIRE = 20, ACID = 15, WOUND = 20)

/obj/item/clothing/suit/armor/vest/scp/eta
	name = "ETA armored vest"
	desc = "A synthetic armor vest designed for MTF unit Eta-10."
	icon_state = "eta-armor"
	worn_icon_state = "eta-armor_s"
	armor = list(MELEE = 70, BULLET = 70, LASER = 70, ENERGY = 70, BOMB = 45, BIO = 15, FIRE = 30, ACID = 25, WOUND = 30)

/obj/item/clothing/suit/armor/vest/scp/beta
	name = "Beta armored suit"
	desc = "A synthetic armor vest designed for MTF unit Beta-7."
	icon_state = "beta-armor"
	worn_icon_state = "beta-armor_s"
	armor = list(MELEE = 90, BULLET = 70, LASER = 40, ENERGY = 25, bomb = 30, bio = 90, FIRE = 20, ACID = 15, WOUND = 20)

/obj/item/clothing/suit/armor/vest/scp/alpha
	name = "Alpha armored vest"
	desc = "A synthetic armor vest designed for MTF unit Alpha-1."
	icon_state = "alpha-armor"
	worn_icon_state = "alpha-armor_s"
	armor = list(MELEE = 100, BULLET = 100, LASER = 90, ENERGY = 95, BOMB = 90, BIO = 90, FIRE = 50, ACID = 55, WOUND = 40)

/obj/item/clothing/suit/armor/vest/scp/mtf_vest
	name = "MTF light armored vest"
	desc = "A synthetic armor vest."
	icon_state = "mtf-tactical"
	worn_icon_state = "mtf-tactical_s"
	armor = list(MELEE = 70, BULLET = 70, LASER = 70, ENERGY = 70, BOMB = 45, BIO = 15, FIRE = 30, ACID = 25, WOUND = 30)

/obj/item/clothing/suit/armor/vest/scp/mtf_vest_heavy
	name = "MTF heavy armored vest"
	desc = "A synthetic armor vest."
	icon_state = "mtf-heavy"
	worn_icon_state = "mtf-heavy_s"
	armor = list(MELEE = 90, BULLET = 70, LASER = 70, ENERGY = 25, bomb = 30, bio = 90, FIRE = 20, ACID = 15, WOUND = 20)
