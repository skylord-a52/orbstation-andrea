/datum/pirate_gang/zetan_cowboys
	name = "ZETAWEST ENFORCERS"

	ship_template_id = "zetan"
	ship_name_pool = "zetan_names"

	threat_title = "Hi"
	threat_content = "AND CAN YOU PLEASE GIVE US A LITTLE MONEY BEFORE THE SUN SETS ON OUR LIFES? \
		THE NIGHT IS LONG AND ALL WE HAVE THIS WORLD IS EACH OTHER. WE HAVE TO BUY WARM MILK \
		TO SOOTHE OUR ACHING STOMACS. $PAYOFF PLEASE OR YOURE FUCKED."
	possible_answers = list("Pay them off","Risk it all")

	response_received = "FUCK YES KID."
	response_too_late = "THANK YOU SO MUCH FOR YOUR OFFER BUT!"
	response_not_enough = "YOUR NAME IS CARVED ON A WALL IN HELL."

/// outfits for zetans
/datum/outfit/pirate/zetan
	name = "Zetan Dephuty"

	id = /obj/item/card/id/advanced
	id_trim = /datum/id_trim/pirate
	uniform = /obj/item/clothing/under/abductor
	suit = /obj/item/clothing/suit/costume/pirate/armored
	ears = /obj/item/radio/headset/syndicate
	glasses = /obj/item/clothing/glasses/eyepatch
	head = /obj/item/clothing/head/cowboy/black
	shoes = /obj/item/clothing/shoes/cowboy
	mask = /obj/item/clothing/mask/bandana/black
	r_hand = /obj/item/gun/zetan_revolver

/datum/outfit/pirate/zetan/captain
	name = "Zetan Lone Star"

	head = /obj/item/clothing/head/cowboy/white
	mask = /obj/item/clothing/mask/bandana/white
	l_hand = /obj/item/gun/zetan_revolver


/// special items for zetan pirates
/obj/item/gun/zetan_revolver
	name = "Pearlescent Revolver Z"
	desc = "The most sophisticated weapon you've ever seen. This revolver's trigger can only be pulled by those with the chunkiest fingers. Will never miss."
	icon = 'orbstation/icons/obj/weapons.dmi'
	lefthand_file = 'orbstation/icons/mob/left_inhand.dmi'
	righthand_file = 'orbstation/icons/mob/right_inhand.dmi'
	icon_state = "zetan_revolver"
	inhand_icon_state = "zetan_revolver"
	throwforce = 10
	throw_speed = 3
	fire_sound = 'sound/weapons/gun/revolver/shot_alt.ogg'
	fire_sound_volume = 90
	spread = 15
	fire_delay = 1 SECONDS
	pin = /obj/item/firing_pin/chunky_fingers
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL

/obj/item/gun/zetan_revolver/Initialize(mapload)
	. = ..()
	chambered = new /obj/item/ammo_casing/mm712x82/bouncy(src)

	AddComponent(/datum/component/boomerang, throw_range+2, TRUE)

/obj/item/gun/zetan_revolver/handle_chamber(empty_chamber, from_firing, chamber_next_round)
	chambered.newshot()

/obj/item/firing_pin/chunky_fingers
	name = "chunky firing pin"
	icon_state = "firing_pin_ayy"
	desc = "This firing pin is huge, the idea of pulling this thing is intimidating."
	fail_message = "Fingers too puny!"

/obj/item/firing_pin/chunky_fingers/pin_auth(mob/living/user)
	if(HAS_TRAIT_NOT_FROM(user, TRAIT_CHUNKYFINGERS, RIGHT_ARM_TRAIT) && HAS_TRAIT_NOT_FROM(user, TRAIT_CHUNKYFINGERS, LEFT_ARM_TRAIT))
		return TRUE
	return (user.active_hand_index % 2) ? HAS_TRAIT_FROM(user, TRAIT_CHUNKYFINGERS, LEFT_ARM_TRAIT) : HAS_TRAIT_FROM(user, TRAIT_CHUNKYFINGERS, RIGHT_ARM_TRAIT)
