// Remove success or failure from being printed alongside objectives
/proc/printobjectives(list/objectives)
	if(!objectives || !objectives.len)
		return
	var/list/objective_parts = list()
	var/count = 1
	for(var/datum/objective/objective in objectives)
		if(objective.check_completion())
			objective_parts += "<b>[objective.objective_name] #[count]</b>: [objective.explanation_text]"
		else
			objective_parts += "<b>[objective.objective_name] #[count]</b>: [objective.explanation_text]"
		count++
	return objective_parts.Join("<br>")
