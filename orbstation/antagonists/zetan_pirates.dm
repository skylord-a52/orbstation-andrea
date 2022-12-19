/datum/pirate_gang/zetan_cowboys
	name = "Western Sharpshooters"

	ship_template_id = "zetan"
	ship_name_pool = "zetan_names"

	threat_title = "Research funding"
	threat_content = "Greetings, we are the %SHIPNAME. If you do not give us lots of DOLLARS \
		we will fire massive lazers beams. %PAYOFF will spare you our STRONG BLAST."
	possible_answers = list("I don't want to get strong blasted!","Strong Blast? I bet it sucks.")

	response_received = "Yippie! Oh by the way Strong Blast isn't real, BYE!!!!!!!!"
	response_too_late = "Thanks ofr the cash but now we want YOUR GUTS."
	response_not_enough = "You call this Cash Money? Get out of here, its gut grabbing time."

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
