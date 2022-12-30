/datum/language/common
	desc = "The galactic common tongue. A trade language composed of several prominent galactic languages, primarily Sol Standard, Draconic, and Mothic."

	/*
	 * syllable lists are taken from a few source syllable lists, but cut down and simplified following the few general rules.
	 * the goal is for each source language to be identifiable, but for the whole language to have a coherent and simple-to-speak
	 * aesthetic.
	 *
	 * - only allow the consonants /m, k, j, n, s, t, l, h, ɡ, ŋ, d, r/, with two or so exceptions per language
	 *
	 * 		- note that /j/ is pronounced like "y" would be pronounced in english
	 *
	 * 		- these are the most common human phonemes with the addition of /r/ (present in mothic and draconic already anyway)
	 * 		  and the removal of /p/, /b/, and /w/ (hard for species without lips to pronounce)
	 *
	 * 		- digraphs (zh, ng, etc) are considered as a single sound, not multiple consonants.
	 *
	 * 		- modification of consonants by the following vowel is ignored -- no palatalization
	 *
	 * 		- r is included as a "simple" consonant because while uncommon in most human languages, it's present in all three source languages
	 *
	 * - only allow the vowels /a, i, u, e, o/ with one allowed exception per language
	 * 		- this mainly applies to mothic.
	 * 		- we'll assume that the english source syllables -- which dont actually use these vowels in reality --
	 * 		  are read as using the five-vowel system instead of english's vowels.
	 *
	 * - min. one and max. two vowels per syllable
	 *
	 * - two consonants in a row ("nt", "hv", etc -- not digraphs) are allowed but on thin ice
	 *
	 * - no doubled letters
	 */

	syllables = list(

		// solcom.
		// unique consonants: f, j, th, zh. no unique vowels.
		// it gets extra consonants because it's kind of two languages.
		// f, j are shared between eng + mand, and th/zh are defining sounds of each language
		list(
			list(
				"a", "ai", "an", "ang", "ao", "da", "dai", "dan", "dang", "dao", "de", "dei",
				"den", "deng", "di", "dian", "die", "ding", "diu", "dong", "dou", "du", "duan", "dui", "dun", "duo", "e",
				"ei", "en", "er", "fa", "fan", "fang", "fei", "fen", "feng", "fo", "fou", "fu", "ga", "gai", "gan", "gang",
				"gao", "ge", "gei", "gen", "geng", "gong", "gou", "gu", "gua", "guan", "guang", "gui", "gun", "guo", "ha",
				"hai", "han", "hang", "hao", "he", "hei", "hen", "heng", "hm", "hng", "hong", "hou", "hu", "hua", "huan",
				"huang", "hui", "hun", "huo", "ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "juan",
				"jue", "jun", "ka", "kai", "kan", "kang", "kao", "ke", "kei", "ken", "keng", "kong", "kou", "ku", "kua",
				"kuan", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lia", "lian",
				"liang", "lie", "lin", "ling", "liu", "long", "lou", "lu", "luan", "lun", "luo", "ma", "mai", "man", "mang",
				"mao", "me", "mei", "men", "meng", "mi", "mian", "mie", "min", "ming", "miu", "mo", "mou", "mu", "na",
				"nai", "nan", "nang", "nao", "ne", "nei", "nen", "neng", "ng", "ni", "nian", "niang", "nie", "nin", "ning",
				"niu", "nong", "nou", "nu", "nuan", "nuo", "o", "ou", "ran", "rang", "rao", "re", "ren", "reng", "ri", "rong", "rou",
				"ru", "rua", "ruan", "rui", "run", "ruo", "sa", "sai", "san", "sang", "sao", "se", "sei", "sen", "seng",
				"si", "song", "sou", "su", "suan", "sui", "sun", "suo", "ta", "tai", "tan", "tang", "tao", "te",
				"teng", "ti", "tian", "tie", "ting", "tong", "tou", "tu", "tuan", "tui", "tun", "tuo",
				"ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yong", "you", "yu", "yuan",
				"yue", "yun", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhei", "zhen", "zheng", "zhi", "zhong", "zhou",
				"zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo"
			),
			list(
				"al", "an", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it",
				"le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to",
				"al", "and", "are", "ent", "era", "ere", "for", "had", "hat", "hen", "her", "hin",
				"his", "ing", "ion", "ith", "not", "ome", "oul", "our", "ted", "ter", "tha", "the", "thi",
			),
		),

		// tiziran/draconic
		// unique consonants: z, sh
		// removed syllables with no vowels, syllables with doubled letters
		list(
			"za", "az", "ze", "ez", "zi", "iz", "zo", "oz", "zu", "uz",
			"ha", "ah", "he", "eh", "hi", "ih", "ho", "oh", "hu", "uh",
			"la", "al", "le", "el", "li", "il", "lo", "ol", "lu", "ul",
			"ka", "ak", "ke", "ek", "ki", "ik", "ko", "ok", "ku", "uk",
			"sa", "as", "se", "es", "si", "is", "so", "os", "su", "us",
			"ra", "ar", "re", "er", "ri", "ir", "ro", "or", "ru", "ur",
			"a",  "a",  "e",  "e",  "i",  "i",  "o",  "o",  "u",  "u",
		),

		// mothic
		// unique consonants: v
		// unique vowels: ä
		// "c" changed to "k",
		// "j" changed to "y" (for consistency with english and mandarin "y")
		// diacritic-modified vowels replaced by base form or ä
		// vowel y replaced with "i"
		// removed doubled letters and syllables with no vowels
		list(
			"ar", "i", "gar", "sek", "mo", "ok", "o", "ga", "la", "le",
			"lit", "igg", "van", "där", "na", "mot", "id", "hvo", "ya", "han",
			"sä", "an", "det", "at", "na", "go", "int", "tik", "om", "när",
			"tva", "ma", "dag", "syä", "vi", "vuo", "eil", "tun", "käit", "teh", "vä",
			"hei", "huo", "suo", "ä", "ten", "ya", "heu", "stu", "uhr", "kon", "we", "hon"
		),

		// syllables unique to galcom.
		// added to give it more of its own identity
		// includes the sounds necessary to say "galcom"
		// heavy bias towards /g/, which is easy to say and relatively unused in other languages
		list(
			list(
				"ga", "gi", "gu", "ge", "go",
			),
			list(
				"gal", "kom", "mok", "lag",
				"ka", "ki", "ku", "ke", "ko",
				"la", "li", "lu", "le", "lo",
				"ma", "mi", "mu", "me", "mo",
			)
		)

	)
