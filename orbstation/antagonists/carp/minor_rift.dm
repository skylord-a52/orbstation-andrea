#define RIFT_CHARGE_TIME 10 MINUTES
#define CHARGE_COMPLETED 2

/**
 * This carp rift doesn't have the charging behaviour and has less armour, any weapon should damage it.
 * Conversely because there's fewer ghosts it also summons a handful of NPC carp.
 */
/obj/structure/carp_rift/minor
	armor = /datum/armor/none
	max_charge = INFINITY
	/// Team to assign new carps to
	var/datum/team/carp_team/team = new()
	/// Timer charging the rift
	var/charge_timer
	/// What time was it when we were created
	var/spawn_time

/obj/structure/carp_rift/minor/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/spawner, \
		_spawn_time = 15 SECONDS, \
		_max_mobs = 3, \
		_faction = list("carp"))
	charge_timer = addtimer(CALLBACK(src, .proc/fully_charge), RIFT_CHARGE_TIME, TIMER_STOPPABLE)
	spawn_time = world.time

/obj/structure/carp_rift/minor/Destroy()
	deltimer(charge_timer)
	return ..()

/obj/structure/carp_rift/minor/show_charge_level()
	if (charge_state == CHARGE_COMPLETED)
		return span_warning("This one is fully charged. In this state, it is poised to transport a much larger amount of carp than normal.")

	var/percent_charged = (world.time - spawn_time) / (RIFT_CHARGE_TIME)
	return span_notice("It seems to be [round(percent_charged * 100)]% charged.")

/obj/structure/carp_rift/minor/on_spawned(mob/living/newcarp)
	newcarp.mind?.add_antag_datum(/datum/antagonist/rift_carp, team)

/// Called after 10 minutes of existing, the rift spawns ghosts twice as fast
/obj/structure/carp_rift/minor/proc/fully_charge()
	charge_state = CHARGE_COMPLETED
	var/area/A = get_area(src)
	priority_announce("Spatial object has reached peak energy charge in [initial(A.name)], please stand-by.", "Central Command Wildlife Observations")
	icon_state = "carp_rift_charged"
	set_light_color(LIGHT_COLOR_YELLOW)
	update_light()
	carp_interval = 30 // No SECONDS define, this is incremented by delta time
	team.succeed()

#undef RIFT_CHARGE_TIME
#undef CHARGE_COMPLETED
