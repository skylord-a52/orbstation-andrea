/datum/quirk/door_closer
	name = "Compulsive Door Closer"
	desc = "There is something that troubles you about walking through airlocks and doors. You absolutely must close them behind you. You can however, close your eyes to push through this."
	icon = "door-closed"
	value = 3
	mob_trait = TRAIT_DOOR_CLOSER
	gain_text = "<span class='danger'>You feel very strongly about passing through doorways.</span>"
	lose_text = "<span class='notice'>You no longer feel very strongly about doorways.</span>"
	medical_record_text = "Patient seems to have superstitions involving doorways."
	mail_goodies = list(/obj/item/clothing/gloves/color/white)
	var/datum/action/shut_eyes_doors/action

/datum/quirk/door_closer/add()
	. = ..()
	quirk_holder.AddElement(/datum/element/door_closer_quirk)
	action = new(quirk_holder)
	action.Grant(quirk_holder)

/datum/quirk/door_closer/remove()
	. = ..()
	quirk_holder.RemoveElement(/datum/element/door_closer_quirk)
	if(!action)
		return
	action.Remove(quirk_holder)
	QDEL_NULL(action)

/// element that is attached to people with the trait door closer that checks if the mob has left a tile with a door on it so that it can close it
/datum/element/door_closer_quirk
	/// list of doors that should not be closed automatically, blast doors, shutters, and firelocks mostly
	var/static/list/secure_doors = list(/obj/machinery/door/poddoor, /obj/machinery/door/firedoor, /obj/machinery/door/window)

#define SHUT_EYES_FOR_DOORS "shut_eyes_for_doors"

/datum/action/shut_eyes_doors
	name = "Ignore Doors"
	check_flags = AB_CHECK_CONSCIOUS
	icon_icon = 'icons/mob/actions/actions_animal.dmi'
	button_icon_state = "adjust_vision"
	desc = "Close your eyes shut and pretend you aren't walking through doors!"

/datum/action/shut_eyes_doors/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return
	if(!isliving(owner))
		return
	var/mob/living/doorguy = owner
	if(HAS_TRAIT_FROM(owner, TRAIT_BLIND, SHUT_EYES_FOR_DOORS))
		doorguy.cure_blind(SHUT_EYES_FOR_DOORS)
	else
		doorguy.become_blind(SHUT_EYES_FOR_DOORS)

#undef SHUT_EYES_FOR_DOORS

/datum/element/door_closer_quirk/Attach(datum/target)
	. = ..()

	if(!isliving(target))
		return ELEMENT_INCOMPATIBLE
	secure_doors = typecacheof(secure_doors)
	RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(close_door))

/datum/element/door_closer_quirk/Detach(datum/target, ...)
	. = ..()

	UnregisterSignal(target, COMSIG_MOVABLE_MOVED)

/datum/element/door_closer_quirk/proc/close_door(mob/living/leaver, turf/old_turf)
	SIGNAL_HANDLER

	if(leaver.stat != CONSCIOUS)
		return
	if(HAS_TRAIT(leaver, TRAIT_HANDS_BLOCKED))
		return
	if(HAS_TRAIT(leaver, TRAIT_BLIND))
		return
	for(var/obj/machinery/door/to_close in old_turf.contents)
		if(is_type_in_typecache(to_close, secure_doors))
			continue
		INVOKE_ASYNC(to_close, TYPE_PROC_REF(/obj/machinery/door, close))
