// SNOUT

/obj/item/organ/external/snout_rat
	name = "ratfolk snout"
	desc = "Take a closer look at that snout!"
	icon_state = "snout"

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_SNOUT
	preference = "feature_rat_snout"
	external_bodytypes = BODYTYPE_SNOUTED

	dna_block = DNA_RAT_SNOUT_BLOCK
	bodypart_overlay = /datum/bodypart_overlay/mutant/snout_rat

/datum/bodypart_overlay/mutant/snout_rat
	layers = EXTERNAL_ADJACENT
	feature_key = "rat_snout"
	color_source = ORGAN_COLOR_OVERRIDE

/datum/bodypart_overlay/mutant/snout_rat/get_global_feature_list()
	return GLOB.rat_snouts_list

/datum/bodypart_overlay/mutant/snout_rat/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(!(human.wear_mask?.flags_inv & HIDESNOUT) && !(human.head?.flags_inv & HIDESNOUT))
		return TRUE
	return FALSE

/datum/bodypart_overlay/mutant/snout_rat/inherit_color(obj/item/bodypart/ownerlimb, force)
	if(draw_color && !force)
		return

	if(!ishuman(ownerlimb.owner))
		return ..()
	var/mob/living/carbon/human/human_owner = ownerlimb.owner
	draw_color = human_owner.facial_hair_color
	return

// TAIL

/obj/item/organ/external/tail/ratfolk
	name = "ratfolk tail"
	desc = "A severed rat tail."
	preference = "feature_rat_tail"
	dna_block = DNA_RAT_TAIL_BLOCK
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/rat

/datum/bodypart_overlay/mutant/tail/rat
	feature_key = "rat_tail"

/datum/bodypart_overlay/mutant/tail/rat/get_global_feature_list()
	return GLOB.rat_tails_list
