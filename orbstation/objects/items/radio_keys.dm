// A set of extra encryption keys for orbstation

/obj/item/encryptionkey/ratfolk
	name = "\improper Ratfolk translation key"
	desc = "An encryption key that automatically encodes ratvaric heard through the radio into common. The signal's a little squeaky."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/ratvaric
	greyscale_config = null
	greyscale_colors = null

/obj/item/encryptionkey/common
	name = "\improper Galactic Common translation key"
	desc = "An encryption key that automatically translates common heard through the radio. The signal's bog standard."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/common
	greyscale_config = null
	greyscale_colors = null

/obj/item/encryptionkey/uncommon
	name = "\improper Galactic Uncommon translation key"
	desc = "An encryption key that automatically translates uncommon heard through the radio into common. The signal's a bit indistinct."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/uncommon
	greyscale_config = null
	greyscale_colors = null

/obj/item/encryptionkey/slime
	name = "\improper Slime translation key"
	desc = "An encryption key that automatically translates slimetongue heard through the radio. The signal's strangely wet."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/slime
	greyscale_config = null
	greyscale_colors = null

/obj/item/encryptionkey/pod
	name = "\improper Podperson translation key"
	desc = "An encryption key that automatically translates sylvan heard through the radio. The signal sounds like rustling leaves."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/sylvan
	greyscale_config = null
	greyscale_colors = null

// Goodie packs for each key

/datum/supply_pack/goody/ratfolk_encryption_key
	name = "Ratvaric radio encryption key"
	desc = "A hi-tech radio encryption key that allows the wearer to understand ratvaric when the radio is worn."
	cost = PAYCHECK_CREW * 12
	contains = list(/obj/item/encryptionkey/ratfolk)

/datum/supply_pack/goody/common_encryption_key
	name = "Galactic Common radio encryption key"
	desc = "A hi-tech radio encryption key that allows the wearer to understand galactic common when the radio is worn."
	cost = PAYCHECK_CREW * 16 //expensive because Common is already widely spoken - less demand
	contains = list(/obj/item/encryptionkey/common)

/datum/supply_pack/goody/uncommon_encryption_key
	name = "Galactic Uncommon radio encryption key"
	desc = "A hi-tech radio encryption key that allows the wearer to understand galactic uncommon when the radio is worn."
	cost = PAYCHECK_CREW * 12
	contains = list(/obj/item/encryptionkey/uncommon)

/datum/supply_pack/goody/slime_encryption_key
	name = "Slime radio encryption key"
	desc = "A hi-tech radio encryption key that allows the wearer to understand slimetongue when the radio is worn."
	cost = PAYCHECK_CREW * 12
	contains = list(/obj/item/encryptionkey/slime)

/datum/supply_pack/goody/podperson_encryption_key
	name = "Sylvan radio encryption key"
	desc = "A hi-tech radio encryption key that allows the wearer to understand sylvan when the radio is worn."
	cost = PAYCHECK_CREW * 12
	contains = list(/obj/item/encryptionkey/pod)
