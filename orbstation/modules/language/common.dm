/datum/language/common
	desc = "The galactic common tongue. A trade language composed of several prominent galactic languages, primarily Sol Standard, Draconic, and Mothic."
	icon = 'orbstation/icons/misc/language.dmi'
	icon_state = "galcom"

	/*
	 * Syllable lists are taken from a few source syllable lists, but cut down and simplified following the few general rules.
	 * The goal is for each source language to be identifiable, but for the whole language to have a coherent and simple-to-speak
	 * aesthetic.
	 *
	 * - Only allow the consonants /m, k, j, n, s, t, l, h, ɡ, ŋ, d, r/, with two or so exceptions per language
	 *
	 * 		- Note that /j/ is pronounced like "y" would be pronounced in English
	 *
	 * 		- These are the most common human phonemes with the addition of /r/ (present in mothic and draconic already anyway)
	 * 		  and the removal of /p/ and /b/ (hard for species without lips to pronounce)
	 *
	 * 		- Digraphs (zh, ng, etc) are considered as a single sound, not multiple consonants.
	 *
	 * 		- Modification of consonants by the following vowel is ignored -- no palatalization
	 *
	 * - Only allow the vowels /a, i, u, e, o/, with one allowed exception per language
	 * 		- This mainly applies to Mothic.
	 * 		- We'll assume that the English source syllables -- which dont actually use these vowels in reality --
	 * 		  are read as using the five-vowel system instead of English's vowels.
	 *
	 * - Two consonants in a row ("nt", "hv", etc -- not digraphs) are allowed... barely.
	 */

	syllables = list(

		// "Complex" syllables, yanked from source languages
		list(
			// Solcom
			// Unique consonants: th, zh (z also allowed, via Draconic)
			// Removed a number of syllables with disallowed consonants or too many vowels
			// Modified some syllables to remove doubled letters
			// Replaced fs with vs (/v/ already allowed via Mothic)
			list(
				list(
					"a", "ai", "an", "ang", "ao", "da", "dai", "dan", "dang", "dao", "de", "dei",
					"den", "deng", "di", "dian", "die", "ding", "diu", "dong", "dou", "du", "duan", "dui", "dun", "duo", "e",
					"ei", "en", "er", "va", "van", "vang", "vei", "ven", "veng", "vo", "vou", "vu", "ga", "gai", "gan", "gang",
					"gao", "ge", "gei", "gen", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo", "ha",
					"hai", "han", "hang", "hao", "he", "hei", "hen", "heng", "hm", "hng", "hong", "hou", "hu", "hua", "huai", "huan",
					"huang", "hui", "hun", "huo", "ka", "kai", "kan", "kang", "kao", "ke", "kei", "ken", "keng", "kong", "kou", "ku", "kua", "kuai",
					"kuan", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lia", "lian",
					"liang", "lie", "lin", "ling", "liu", "long", "lou", "lu", "luan", "lun", "luo", "ma", "mai", "man", "mang",
					"mao", "me", "mei", "men", "meng", "mi", "mian", "mie", "min", "ming", "miu", "mo", "mou", "mu", "na",
					"nai", "nan", "nang", "nao", "ne", "nei", "nen", "neng", "ng", "ni", "nian", "niang", "nie", "nin", "ning",
					"niu", "nong", "nou", "nu", "nuan", "nuo", "o", "ou", "ran", "rang", "rao", "re", "ren", "reng", "ri", "rong", "rou",
					"ru", "rua", "ruan", "rui", "run", "ruo", "sa", "sai", "san", "sang", "sao", "se", "sei", "sen", "seng",
					"si", "song", "sou", "su", "suan", "sui", "sun", "suo", "ta", "tai", "tan", "tang", "tao", "te",
					"teng", "ti", "tian", "tie", "ting", "tong", "tou", "tu", "tuan", "tui", "tun", "tuo",
					"ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yong", "you", "yu", "yuan",
					"yue", "yun", "za", "zai", "zan", "zang", "zao", "ze", "zei", "zen", "zeng", "zha", "zhai", "zhan", "zhang", "zhao",
					"zhe", "zhei", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo", "zi",
					"zong", "zou", "zuan", "zui", "zun", "zuo", "zu",
				),
				list(
					"al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it",
					"le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to",
					"ve", "wa", "al", "and", "are", "ent", "era", "ere", "vor", "eve", "had", "hat", "hen", "her", "hin",
					"his", "ing", "ion", "ith", "not", "ome", "oul", "our", "ted", "ter", "tha", "the", "thi",
				),
			),

			// Tiziran/Draconic
			// Unique consonants: z, sh
			// No unique vowels
			list(
				"za", "az", "ze", "ez", "zi", "iz", "zo", "oz", "zu", "uz", "zs", "sz",
				"ha", "ah", "he", "eh", "hi", "ih", "ho", "oh", "hu", "uh",
				"la", "al", "le", "el", "li", "il", "lo", "ol", "lu", "ul", "ls", "sl",
				"ka", "ak", "ke", "ek", "ki", "ik", "ko", "ok", "ku", "uk", "ks", "sk",
				"sa", "as", "se", "es", "si", "is", "so", "os", "su", "us", "ss", "ss",
				"ra", "ar", "re", "er", "ri", "ir", "ro", "or", "ru", "ur", "rs", "sr",
				"a",  "a",  "e",  "e",  "i",  "i",  "o",  "o",  "u",  "u", "s",  "s"
			),

			// Mothic
			// Unique consonants: v
			// Unique vowels: ä
			// "c" changed to "k"
			// "j" changed to "y" (for consistency with english and mandarin "y")
			// Diacritic-modified vowels replaced by base form or ä
			// Vowel y replaced with "i"
			// Removed doubled letters
			list(
				"ar", "i", "gar", "sek", "mo", "ok", "gy", "o", "ga", "la", "le",
				"lit", "ig", "van", "där", "na", "mot", "id", "hvo", "ya", "han",
				"sä", "an", "det", "at", "na", "go", "int", "tik", "om", "när",
				"tva", "ma", "dag", "syä", "vi", "vuo", "eil", "tun", "käit", "teh", "vä",
				"hei", "huo", "suo", "ä", "ten", "ya", "heu", "stu", "uhr", "kon", "we", "hon"
			),

			// Complex syllables unique to Galcom.
			list(

				"gai", "gao", "gam", "gal",
				"gia", "giu", "gio", "gim", "gil",
				"guo", "gui", "gua", "gum", "gul",
				"geo", "gei", "gem", "gel",
				"goi", "gou", "gom", "gol",
				"gäi", "gäo", "gäm", "gäl",


				"gal", "kom", "mok", "lag",
			)
		) = 1,

		// Simple syllables making up the bulk of the language
		// Based on the general distribution of the source languages after removing complex/rare consonants
		list(
			"ga", "gi", "gu", "ge", "go", "gä",
			"ka", "ki", "ku", "ke", "ko", "kä",
			"la", "li", "lu", "le", "lo", "lä",
			"ma", "mi", "mu", "me", "mo", "mä",
			"sa", "si", "su", "se", "so", "sä",
			"za", "zi", "zu", "ze", "zo", "zä",
			"ra", "ri", "ru", "re", "ro", "rä",
			"ta", "ti", "tu", "te", "to", "tä",
			"va", "vi", "vu", "ve", "vo", "vä",
			"ya", "yi", "yu", "ye", "yo", "yä",
			"wa", "wi", "wu", "we", "wo", "wä",
		) = 2

	)
