/datum/quirk/food_order_subscriber
	name = "Food Delivery Subscription"
	desc = "You have subscribed to NTGRUB, for a low-low price you will receive regular deliveries of food tailored to your tastes."
	icon = "box-open"
	value = 6
	mob_trait = TRAIT_NTGRUB_SUB
	gain_text = "<span class='danger'>You have subscribed to NTGRUB!</span>"
	lose_text = "<span class='notice'>You feel as if your subscription to NTGRUB has been cancelled.</span>"
	medical_record_text = "Patient is susceptible to GREAT DEALS! SUBSCRIBE TO NTGRUB NOW."
	mail_goodies = list(/obj/item/plate/large, /obj/item/kitchen/fork, /obj/item/knife/plastic, /obj/item/kitchen/spoon, /obj/item/reagent_containers/cup/bowl)
	var/datum/component/food_order_sub_quirk/quirk_component
	/// semi random list of foods for NTGRUB
	var/static/list/ntgrub_foodlist = list(
		/obj/item/food/blt,
		/obj/item/food/danish_hotdog,
		/obj/item/food/jellysandwich,
		/obj/item/food/jellysandwich/slime,
		/obj/item/food/patzikula,
		/obj/item/food/ratatouille,
		/obj/item/food/fiesta_corn_skillet,
		/obj/item/food/mushroomy_stirfry,
		/obj/item/food/chipsandsalsa,
		/obj/item/food/chococornet,
		/obj/item/food/brownie_sheet,
		/obj/item/food/soup/rice_porridge,
		/obj/item/food/cheesyburrito,
		/obj/item/food/jelliedtoast/cherry,
		/obj/item/food/cheese/cheese_curds,
		/obj/item/food/grilled_cheese,
		/obj/item/food/baked_cheese_platter,
		/obj/item/food/cannoli,
		/obj/item/food/mozzarella_sticks,
		/obj/item/food/cheesynachos,
		/obj/item/food/mac_balls,
		/obj/item/food/chocolatebar,
		/obj/item/food/popcorn/caramel,
		/obj/item/food/fries,
		/obj/item/food/poutine,
		/obj/item/food/mint,
		/obj/item/food/spiderlollipop,
		/obj/item/food/yakiimo,
		/obj/item/food/omelette,
		/obj/item/food/cubancarp,
		/obj/item/food/fishtaco,
		/obj/item/food/spicyfiletsushiroll,
		/obj/item/food/lasagna,
		/obj/item/food/full_english,
		/obj/item/food/bbqribs,
		/obj/item/food/melonfruitbowl,
		/obj/item/food/springroll,
		/obj/item/food/pizza/flatbread/rustic,
		/obj/item/food/cakeslice/korta_brittle,
		/obj/item/food/spaghetti/demit_nizaya,
		/obj/item/food/moonfish_demiglace,
		/obj/item/food/crispy_headcheese,
		/obj/item/food/lizard_surf_n_turf,
		/obj/item/food/emperor_roll,
		/obj/item/food/pie/shepherds_pie,
		/obj/item/food/pizza/flatbread/rawmeat,
		/obj/item/food/frenchtoast,
		/obj/item/food/butterbiscuit,
		/obj/item/food/burger/tofu,
		/obj/item/food/burger/brain,
		/obj/item/food/burger/jelly/slime,
		/obj/item/food/burger/baconburger,
		/obj/item/food/cookie/sugar,
		/obj/item/food/soup/jellyfish,
		/obj/item/food/salad/jungle,
		/obj/item/food/salad/citrusdelight,
		/obj/item/food/salad/greek_salad,
		/obj/item/food/salad/potato_salad,
		/obj/item/food/spaghetti/beefnoodle,
		/obj/item/food/spaghetti/mac_n_cheese,
		/obj/item/food/soup/slime,
		/obj/item/food/soup/blood,
		/obj/item/food/soup/wingfangchu,
		/obj/item/food/soup/nettle,
		/obj/item/food/soup/hotchili,
		/obj/item/food/soup/beet/red,
		/obj/item/food/soup/electron,
		/obj/item/food/soup/cullen_skink
		)

/// generates list of food NTGRUB will deliver to you, removing disliked and toxic foods, then making a list of liked foods, and returning whatever is valid
/datum/quirk/food_order_subscriber/proc/create_foodlist()
	if(HAS_TRAIT(quirk_holder, TRAIT_NOHUNGER))
		return list(/obj/item/food/pizza/energy, /obj/item/food/pizza/energy, /obj/item/food/pizza/energy, /obj/item/stock_parts/cell, /obj/item/stock_parts/cell/upgraded/plus)
	if(!iscarbon(quirk_holder))
		return ntgrub_foodlist
	var/mob/living/carbon/quirk_owner = quirk_holder
	var/list/deliverable_food = list()
	for (var/obj/item/food/foodpath as anything in ntgrub_foodlist)
		var/food_types = initial(foodpath.foodtypes)
		if(food_types & quirk_owner.dna.species.toxic_food)
			continue
		if(food_types & quirk_owner.dna.species.disliked_food)
			continue
		deliverable_food += foodpath
	var/list/favorite_food = list()
	for (var/obj/item/food/likedpath as anything in deliverable_food)
		var/food_types = initial(likedpath.foodtypes)
		if(food_types & quirk_owner.dna.species.liked_food)
			favorite_food += likedpath
	if(length(favorite_food))
		return favorite_food
	return deliverable_food

/datum/quirk/food_order_subscriber/add()
	. = ..()
	var/list/delivery = create_foodlist()
	quirk_component = quirk_holder.AddComponent(/datum/component/food_order_sub_quirk)


/datum/quirk/food_order_subscriber/remove()
	. = ..()
	QDEL_NULL(quirk_component)


/datum/component/food_order_sub_quirk
	/// Timer between deliveries
	var/delivery_timer
	var/max_delivery_time
	var/min_delivery_time
	var/list/deliverable_food

///
/datum/component/food_order_sub_quirk/Initialize(list/deliverable_food, max_delivery_time = 20 MINUTES , min_delivery_time = 10 MINUTES, delivery_charge = PAYCHECK_CREW * .25)
	. = ..()
	if(!ishuman(parent))
		return COMPONENT_INCOMPATIBLE
	if(!length(deliverable_food))
		CRASH("Theres no food to deliver!!!")
	var/mob/living/human/quirk_payer = parent
	var/datum/bank_account/quirk_account = SSeconomy.bank_accounts_by_id["[quirk_payer.account_id]"]
	if(!quirk_account)
		return COMPONENT_INCOMPATIBLE

	src.deliverable_food = deliverable_food
	src.max_delivery_time = max_delivery_time
	src.min_delivery_time = min_delivery_time
	src.delivery_charge = delivery_charge

	schedule_payment()

/datum/component/food_order_sub_quirk/Destroy(force, silent)
	. = ..()
	deltimer(delivery_timer)

/datum/component/food_order_sub_quirk/proc/schedule_payment()
	var/random_time = rand(min_delivery_time, max_delivery_time)
	delivery_timer = addtimer(CALLBACK(src, PROF_REF()), wait = random_time, flags = TIMER_STOPPABLE)

/datum/component/food_order_sub/proc/food_notification()
	var/mob/living/human/quirk_payer = parent
	var/datum/bank_account/quirk_account = SSeconomy.bank_accounts_by_id["[quirk_payer.account_id]"]
	if(!quirk_account)
		qdel(src)
		return
	// schedules next delivery if you can not pay
	var/has_headset = istype(quirk_payer.ears, /obj/item/radio/headset)
	if(!quirk_account.adjust_money(-delivery_charge, "NTGRUB"))
		schedule_payment()
		if(has_headset)
			to_chat(quirk_payer, span_hear("Your NTGRUB payment has failed. Delivery will be moved to the next attempt, we hope that you can pay then!"))
		return
	if(has_headset)
		to_chat(quirk_payer, span_hear("Your NTGRUB payment has succeeded. Your NTGRUB meal will be delivered to your location shortly."))

