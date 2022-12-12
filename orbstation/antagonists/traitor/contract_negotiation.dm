#define CUSTOM_OBJECTIVE_MAX_LENGTH 300

/datum/uplink_category/contract
	name = "Contract Negotiation"
	weight = -3 // just above discount items (because those are apparently hard-coded to be at the bottom)

/datum/uplink_item/contract
	category = /datum/uplink_category/contract
	surplus = 0
	cant_discount = TRUE

/datum/uplink_item/contract/freeform
	name = "Renegotiate Contract"
	desc = "Opt out of conventional objectives and forge your own path forward in pursuit of a custom goal. \
	Be warned that you will no longer be able to earn telecrystals. There is no turning back."
	item = /obj/effect/gibspawner/generic
	surplus = 0
	cost = 0
	restricted = TRUE
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	purchase_log_vis = FALSE

	/// The default explanation of the freeform objective, which can be customized by the traitor.
	var/default_objective_text = "Sow fear and discord as a free agent of the Syndicate."

/datum/uplink_item/contract/freeform/spawn_item(spawn_path, mob/user, datum/uplink_handler/uplink_handler, atom/movable/source)
	var/datum/antagonist/traitor/traitor_datum
	for(var/datum/antagonist/antag in user.mind.antag_datums)
		if(istype(antag, /datum/antagonist/traitor))
			traitor_datum = antag
			break

	// Non-traitors can't use this for obvious reasons :v
	if(!traitor_datum)
		return source //For log icon

	for(var/datum/objective/primary_objective in traitor_datum.objectives)
		if(uplink_handler.final_objective) // prevents overriding pre-existing custom objectives or final objectives
			to_chat(user, span_warning("Request denied. The terms of your current contract are non-negotiable."))
			return source

	// Allow the traitor to write down a custom objective if they so wish.
	var/custom_objective_text = tgui_input_text(user, "Write down the terms of your new contract:", "Custom Objective", default_objective_text, CUSTOM_OBJECTIVE_MAX_LENGTH)
	if(!custom_objective_text) // such as if the user hits "cancel"
		return source

	var/datum/traitor_objective/ultimate/renegotiate/new_objective = uplink_handler.try_add_objective(/datum/traitor_objective/ultimate/renegotiate)
	if(!new_objective)
		CRASH("Failed to create the renegotiate contract objective!")

	new_objective.name = custom_objective_text

	log_traitor("[key_name(user)] opted out of uplink objectives and chose a custom objective: [custom_objective_text]")
	message_admins("[ADMIN_LOOKUPFLW(user)] has chosen a custom traitor objective: [span_syndradio("[custom_objective_text]")] | [ADMIN_SYNDICATE_REPLY(user)]")

	for(var/client/admin_client in GLOB.admins)
		if(admin_client.prefs.toggles & SOUND_ADMINHELP)
			SEND_SOUND(admin_client, sound('sound/effects/gong.ogg'))

	// Let's fail all the active objectives on the uplink to get them out of the way.
	for(var/datum/traitor_objective/active_objective as anything in uplink_handler.active_objectives)
		active_objective.fail_objective(penalty_cost = 0)

	uplink_handler.take_objective(user, new_objective)

	to_chat(user, span_boldwarning("Your request has been received. Until further notice, these are the new terms of your contract. Good luck, agent."))

	return source

/datum/traitor_objective/ultimate/renegotiate
	name = "Contract renegotiation"
	description = "Try to accomplish your final objective at any cost."
	progression_minimum = 0 MINUTES
	progression_points_in_objectives = 0 MINUTES

/datum/traitor_objective/ultimate/renegotiate/can_generate_objective(generating_for, list/possible_duplicates)
	return TRUE

/datum/traitor_objective/ultimate/renegotiate/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	return TRUE

#undef CUSTOM_OBJECTIVE_MAX_LENGTH
