//character preference, makes character height selectable from five options

/datum/preference/choiced/height
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "height"
	can_randomize = FALSE
	var/height_list = list(
		"Shortest" = HUMAN_HEIGHT_SHORTEST,
		"Short" = HUMAN_HEIGHT_SHORT,
		"Medium" = HUMAN_HEIGHT_MEDIUM,
		"Tall" = HUMAN_HEIGHT_TALL,
		"Tallest" = HUMAN_HEIGHT_TALLEST,
	)

/datum/preference/choiced/height/init_possible_values()
	return list("Shortest", "Short", "Medium", "Tall", "Tallest")

/datum/preference/choiced/height/create_default_value()
	return "Medium"

/datum/preference/choiced/height/apply_to_human(mob/living/carbon/human/target, value)
	target.set_mob_height(height_list[value])
