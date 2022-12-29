// Fully heal kidnapees, the syndicate don't leave evidence of tampering
/datum/traitor_objective/kidnapping/handle_victim(mob/living/carbon/human/sent_mob)
	sent_mob.heal_and_revive(80) // They'll heal you but mostly only enough to get out of crit
	sent_mob.fully_heal(HEAL_ORGANS|HEAL_WOUNDS|HEAL_BLOOD|HEAL_TEMP|HEAL_ALL_REAGENTS)
	return ..()
