
/obj/item/buster_sword
	name = "comically oversized sword"
	desc = "Too big, too thick, too heavy, and too rough. This is more like a raw hunk of iron."
	icon = 'orbstation/icons/obj/weapons.dmi'
	icon_state = "buster_sword"
	w_class = WEIGHT_CLASS_HUGE
	drag_slowdown = 2
	tk_throw_range = 1
	tk_throw_range = 1
	/// Damage to deal to someone this is dragged across
	var/dragged_force = 15

/obj/item/buster_sword/equipped(mob/user, slot, initial)
	. = ..()
	balloon_alert(user, "too heavy!")
	user.dropItemToGround(src)

/obj/item/buster_sword/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change)
	. = ..()
	if (!isturf(old_loc) || !isturf(loc))
		return
	if (!has_gravity())
		return
	for (var/mob/living/crossed in loc)
		if (ishuman(crossed))
			if (crossed.body_position == LYING_DOWN)
				omnislash(crossed)
			continue
		if (crossed.mob_size > MOB_SIZE_HUMAN)
			continue
		omnislash(crossed)

	var/turf/left_tile = get_turf(old_loc)
	if (!isfloorturf(left_tile))
		return
	if (prob(60))
		return
	left_tile.break_tile()

/obj/item/buster_sword/proc/omnislash(mob/living/victim)
	var/target_zone = pick(list(
			BODY_ZONE_HEAD, BODY_ZONE_CHEST,
			BODY_ZONE_R_ARM, BODY_ZONE_L_ARM,
			BODY_ZONE_R_LEG, BODY_ZONE_L_LEG,))
	var/armour = victim.run_armor_check(target_zone, MELEE)
	victim.apply_damage(damage = dragged_force, def_zone = target_zone, blocked = armour, wound_bonus = 5, bare_wound_bonus = 15, sharpness = SHARP_EDGED)
