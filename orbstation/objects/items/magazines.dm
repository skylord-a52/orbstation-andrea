/**
 * Small books that give a mood bonus to the reader, slightly higher than normal books.
 * 
 * They're not granters in the traditional sense (no knowledge or spells learned here, although they do give a moodlet) 
 * but the stuff set up by the granter superclass is useful here -- progress bars, effect performed when you finish, no real content, etc.
 */
/obj/item/book/granter/magazine
	name = "\improper magazine"
	icon = 'orbstation/icons/obj/magazine.dmi'
	icon_state ="magazine"
	worn_icon_state = "magazine"
	desc = "A glossy magazine, full of advertisements, gossip, pictures, and maybe a few articles crammed between all that."
	attack_verb_continuous = list("slaps", "whacks", "thwaps")
	attack_verb_simple = list("slap", "whack", "thwap")
	
	unique = TRUE

	uses = INFINITY // we dont care how many times the magazine is read, just whether this specific person has done so.
	pages_to_mastery = 1

	var/mood_boost = 2

/// Called when the user starts to read the magazine.
/obj/item/book/granter/magazine/on_reading_start(mob/living/user)
	to_chat(user, span_notice("You start flipping through \the [name]..."))

/// Called when the user completes the magazine.
/obj/item/book/granter/magazine/on_reading_finished(mob/living/user)
	to_chat(user, span_notice("You finish reading \the [name]!"))

	// copied from book/on_read()
	LAZYINITLIST(user.mind?.book_titles_read)
	var/has_not_read_book = isnull(user.mind?.book_titles_read[starting_title])

	if(has_not_read_book) // any new magazines give bonus mood
		user.add_mood_event("magazine", /datum/mood_event/magazine, src)
		user.mind?.book_titles_read[starting_title] = TRUE

/// Display a message if they've already read it.
/obj/item/book/granter/magazine/recoil(mob/living/user)
	to_chat(user, span_warning("You think you've read enough of \the [name] for now."))

/// Prevent people from reading the same magazine twice
/obj/item/book/granter/magazine/can_learn(mob/living/user)
	// depending on peoples thoughts on the rp value of magazines, this may be removed
	// letting people read them as much as they want, but only getting the mood bonus the first time

	LAZYINITLIST(user.mind?.book_titles_read)
	var/has_read = user.mind?.book_titles_read[starting_title] // null if they havent, something truthy if they have

	if (has_read)
		recoil(user)
		return FALSE

	return TRUE


///////////////////////////////////////// Mood Boost /////////////////////////////////////////


/datum/mood_event/magazine
	description = "That magazine was really interesting."
	mood_change = 2
	timeout = 5 MINUTES

/datum/mood_event/magazine/add_effects(obj/item/book/granter/magazine/target_mag)
	description = "\The [target_mag.name] was really interesting."
	mood_change = target_mag.mood_boost


///////////////////////////////////////// Kinds of magazine /////////////////////////////////////////


/obj/item/book/granter/magazine/mothboy
	name = "Mothboys Monthly"
	desc = "A saucy rag full of exposed exoskeletons, fluffy tails, and bashful antennae."

/obj/item/book/granter/magazine/gal_geo
	name = "Galactic Geographic"
	desc = "An informative publication on the flora, fauna, and peoples of the galaxy. Features large and beautiful pictures by expert photographers."

/obj/item/book/granter/magazine/pop_sci
	name = "Popular R&D"
	desc = "A magazine focused on recent discoveries in science and engineering, written for the layman. \
			Apparently flying cars are only 20 years away, \"for real this time\"."
