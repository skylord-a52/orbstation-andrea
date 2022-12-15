/// lets be honest we're going to go ga-ga for this thing
/datum/status_effect/organ_set_bonus/rat/enable_bonus()
	. = ..()
	var/mob/living/carbon/human/human = owner
	if(!istype(owner))
		return
	var/obj/item/organ/external/tail/ratfolk/mouseyt = new mouseytail()
	var/obj/item/organ/internal/ears/ratfolk/mouseye = new mouseyear()

	mouseytail.Insert(owner, special = FALSE, drop_if_replaced = FALSE)
	mouseyear.Insert(owner, special = FALSE, drop_if_replaced = FALSE)
	return
