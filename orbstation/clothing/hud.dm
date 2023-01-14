/obj/item/clothing/glasses/hud/health/sunglasses/eyepatch
	name = "eyepatch Medical HUD"
	desc = "The cooler looking cousin of Medical HUDSunglasses."
	icon_state = "medpatch"

/obj/item/clothing/glasses/hud/health/sunglasses/gars
	name = "medical HUD gar glasses"
	desc = "GAR glasses with a Medical HUD."
	icon_state = "gar_med"
	inhand_icon_state = "gar_black"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/clothing/glasses/hud/health/sunglasses/gars/giga
	name = "giga Medical HUD gar glasses"
	desc = "GIGA GAR glasses with a Medical HUD."
	icon_state = "gigagar_med"
	force = 12
	throwforce = 12

/obj/item/clothing/glasses/hud/health/meson
	name = "med gar mesons"
	desc = "Now you'll know how close you were to killing the monster that'll take you down."
	icon_state = "gar_mesonmed"
	inhand_icon_state = "gar_meson"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	clothing_traits = list(TRAIT_MADNESS_IMMUNE)
	darkness_view = 2
	vision_flags = SEE_TURFS
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/eyepatch
	name = "eyepatch Diagnostic HUD"
	desc = "The cooler looking cousin of Diagnostic HUDSunglasses."
	icon_state = "diagpatch"

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/gars
	name = "diagnostic HUD gar glasses"
	desc = "GAR glasses with a Diagnostic HUD."
	icon_state = "gar_diag"
	inhand_icon_state = "gar_black"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/gars/giga
	name = "giga Diagnostic HUD gar glasses"
	desc = "GIGA GAR glasses with a Diagnostic HUD."
	icon_state = "gigagar_diag"
	force = 12
	throwforce = 12

/obj/item/clothing/glasses/sunglasses/chemical/eyepatch
	name = "eyepatch Science HUD"
	desc = "The cooler looking cousin of Science HUDSunglasses."
	icon_state = "scipatch"

/obj/item/clothing/glasses/sunglasses/chemical/gars
	name = "science HUD gar glasses"
	desc = "GAR glasses with a Science HUD."
	icon_state = "gar_sci"
	inhand_icon_state = "gar_black"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/clothing/glasses/sunglasses/chemical/gars/giga
	name = "giga Science HUD gar glasses"
	desc = "GIGA GAR glasses with a Science HUD."
	icon_state = "gigagar_sci"
	force = 12
	throwforce = 12

/obj/item/clothing/glasses/hud/security/sunglasses/eyepatch
	name = "eyepatch Security HUD"
	desc = "The cooler looking cousin of security HUDSunglasses."

/obj/item/clothing/glasses/hud/security/sunglasses/gars
	name = "security HUD gar glasses"
	desc = "GAR glasses with a security HUD."

/obj/item/clothing/glasses/hud/security/sunglasses/gars/giga
	name = "giga security HUD gar glasses"
	desc = "GIGA GAR glasses with a security HUD."

//removed a flippant joke about police brutality
/obj/item/clothing/glasses/hud/spacecop
	name = "aviators"
	desc = "You can be my wingman anytime."

// changed to match aviators
/obj/item/clothing/glasses/hud/spacecop/hidden
	desc = "Bullshit, You can be my wingman."
