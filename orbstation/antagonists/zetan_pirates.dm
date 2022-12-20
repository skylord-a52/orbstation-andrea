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

/datum/outfit/pirate/zetan/captain
	name = "Zetan Lone Star"

	head = /obj/item/clothing/head/cowboy/white
	mask = /obj/item/clothing/mask/bandana/white


/// special items for zetan pirates
