/// lets be honest we're going to go ga-ga for this thing

/// adds to upstream branches organ set bonus to give ratfolk organs if you get the other rat organs
/datum/status_effect/organ_set_bonus/rat/enable_bonus()
	. = ..()
	var/mob/living/carbon/human/human = owner
	if(!istype(owner))
		return

	if(isrsatfolk(owner))
		return
	var/obj/item/organ/external/tail/ratfolk/mouseytail = new()
	var/obj/item/organ/internal/ears/ratfolk/mouseyear = new()

	mouseytail.Insert(owner, special = FALSE, drop_if_replaced = FALSE)
	mouseyear.Insert(owner, special = FALSE, drop_if_replaced = FALSE)
	return


/// same but removes external organs,
/datum/status_effect/organ_set_bonus/rat/disable_bonus
	. = ..()
	var/mob/living/carbon/human/human = owner
	if(!istype(owner))
		return
	if(isrsatfolk(owner))
		return

	var/obj/item/organ/internal/ears/ratfolk/mouseyear = owner.getorganslot(ORGAN_SLOT_EARS)
	var/obj/item/organ/external/tail/ratfolk/mouseytail = owner.getorganslot(ORGAN_SLOT_EXTERNAL_TAIL)

	mouseytail.Remove(owner, special = FALSE, drop_if_replaced = FALSE)
	mouseyear.Remove(owner, special = FALSE, drop_if_replaced = FALSE)
	return
