/datum/preference_middleware/jobs
	/// Highest priority selected for each head
	var/list/biggest_head = list()
	/// Selected players for each department
	var/list/department_counts = list()
	/// Unique players with a high priority job in this department
	var/list/department_high = list()

/// Generates the information you need to display a heatmap
/datum/preference_middleware/jobs/proc/generate_heatmap()
	biggest_head = list()
	department_counts = list()
	department_high = list()
	for(var/mob/dead/new_player/player as anything in GLOB.new_player_list)
		if (player.ready != PLAYER_READY_TO_PLAY)
			continue
		if (!player.check_preferences())
			continue
		if (!player.mind)
			continue
		var/list/player_depts = list()
		var/player_high
		for (var/job in player.client?.prefs.job_preferences)
			var/priority = player.client?.prefs.job_preferences[job]
			if (priority == 0)
				continue
			var/datum/job/job_details = SSjob.GetJob(job)
			if (!job_details.departments_list)
				continue
			var/department_type = job_details.departments_list[1]
			var/datum/job_department/department = SSjob.get_department_type(department_type)
			player_depts |= department.department_name
			if (priority == JP_HIGH)
				player_high = department.department_name

			if (job_details.departments_bitflags & DEPARTMENT_BITFLAG_COMMAND || job_details.title == JOB_AI)
				if (!biggest_head[job_details.title])
					biggest_head[job_details.title] = 0
				if (priority > biggest_head[job_details.title])
					biggest_head[job_details.title] = priority

		for (var/department in player_depts)
			if (!department_counts[department])
				department_counts[department] = 0
			department_counts[department] += 1
		if (!player_high)
			return
		if (!department_high[player_high])
			department_high[player_high] = 0
		department_high[player_high] += 1

/datum/preference_middleware/jobs/get_ui_data(mob/user)
	var/list/data = ..()

	generate_heatmap()
	data["biggest_head"] = biggest_head
	data["department_counts"] = department_counts
	data["department_high"] = department_high

	return data
