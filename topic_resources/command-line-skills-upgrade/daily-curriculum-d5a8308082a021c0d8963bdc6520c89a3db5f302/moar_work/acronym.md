# Acronym-er

Create a function to turn any word into a randomized acronym.

- Create a method that takes a string argument
- Find a random word that starts with each letter from the array of words below
- Capitalize and concatenate each word to form the full sentence

```ruby
acronymer("bug") # => "Baloonful Uncartooned Goosehouse"
```

```ruby
["Aizoon", "Boone", "Demophoon", "Dioon", "Diplozoon", "Gaboon", "Gadswoons", "Joon", "Kokoona", "Leucocytozoon", "Roosevelt", "Rooseveltian", "Toona", "Walloon", "aboon", "actinozoon", "afternoon", "afternoons", "akhoond", "aloose",
  "alsoon", "antenoon", "anthozoon", "antiballooner", "antimonsoon", "antisaloon", "antisalooner", "archbuffoon", "aroon", "aswoon", "aswooned", "baboon", "baboonery", "baboonish", "baboonroot", "ballatoon", "balloon", "balloonation", "ballooner", "balloonery", "balloonet", "balloonfish",
  "balloonflower", "balloonful", "ballooning", "balloonish", "balloonist", "balloonlike", "bargoose", "barracoon", "bassoon", "bassoonist", "bemoon", "bigaroon", "boon", "boondock", "boondocks", "boondoggle", "boondoggler", "boonfellow", "boongary", "boonk", "boonless", "boose", "bosthoon", "bridoon", "broon",
  "broose", "bryozoon", "buffoon", "buffoonery", "buffoonesque", "buffoonish", "buffoonism", "burnoose", "burnoosed", "caboose", "cacoon", "calaboose", "calycozoon", "cantoon", "carcoon", "cardoon", "cargoose", "caroon", "cartoon", "cartoonist", "cassoon", "chemiloon", "choose", "chooser",
  "cocoon", "cocoonery", "cooncan", "coonily", "cooniness", "coonroot", "coonskin", "coontail", "coontie", "coony", "cooser", "coquetoon", "croon", "crooner", "crooning", "crooningly", "cytozoon", "dahoon", "dermatozoon", "dermatozoonosis", "dessertspoon", "dessertspoonful", "dhoon", "doon", "doubloon",
  "dragoon", "dragoonable", "dragoonade", "dragoonage", "dragooner", "ducatoon", "ectozoon", "eftsoons", "embergoose", "emmergoose", "entozoon", "eozoon", "eozoonal", "epiploon", "epizoon", "espantoon", "festoon", "festoonery", "festoony", "flocoon", "floroon", "fooner", "forechoose", "forenoon",
  "frigatoon", "gadroon", "gadroonage", "galloon", "gallooned", "gambroon", "gandergoose", "gandermooner", "gombroon", "goon", "goondie", "goonie", "goose", "goosebeak", "gooseberry", "goosebill", "goosebird", "goosebone", "gooseboy", "goosecap", "goosefish", "gooseflower", "goosefoot", "goosegirl", "goosegog",
  "gooseherd", "goosehouse", "gooselike", "goosemouth", "gooseneck", "goosenecked", "gooserumped", "goosery", "goosetongue", "gooseweed", "goosewing", "goosewinged", "gossoon", "groose", "harpoon", "harpooner", "hematocytozoon", "hematozoon", "hemocytozoon", "hemozoon", "honeymoon", "honeymooner", "honeymoonlight",
  "honeymoonshine", "honeymoonstruck", "honeymoony", "hookaroon", "hoon", "hoonoomaun", "hoose", "hoosegow", "huccatoon", "hydrozoon", "hyperoon", "igloo", "kanoon", "khahoon", "kokoon", "kroon", "lagoon", "lagoonal", "lagoonside", "lampoon", "lampooner", "lampoonery", "lampoonist", "langoon", "loon", "loonery",
  "looney", "loony", "loose", "loosely", "loosemouthed", "loosen", "loosener", "looseness", "looser", "loosestrife", "macaroon", "majoon", "maroon", "marooner", "marsoon", "matzoon", "metazoon", "microzoon", "midafternoon", "midforenoon", "midnoon", "mischoose", "mongoose", "monsoon", "monsoonal", "monsoonish",
  "monsoonishly", "moon", "moonack", "moonbeam", "moonbill", "moonblink", "mooncalf", "mooncreeper", "moondown", "moondrop", "mooned", "mooner", "moonery", "mooneye", "moonface", "moonfaced", "moonfall", "moonfish", "moonflower", "moonglade", "moonglow", "moonhead", "moonily", "mooniness", "mooning", "moonish",
  "moonite", "moonja", "moonjah", "moonless", "moonlet", "moonlight", "moonlighted", "moonlighter", "moonlighting", "moonlighty", "moonlike", "moonlikeness", "moonlit", "moonlitten", "moonman", "moonpath", "moonpenny", "moonproof", "moonraker", "moonraking", "moonrise", "moonsail", "moonscape", "moonseed",
  "moonset", "moonshade", "moonshine", "moonshiner", "moonshining", "moonshiny", "moonsick", "moonsickness", "moonstone", "moontide", "moonwalker", "moonwalking", "moonward", "moonwards", "moonway", "moonwort", "moony", "moose", "mooseberry", "moosebird", "moosebush", "moosecall", "mooseflower",
  "moosehood", "moosemise", "moosetongue", "moosewob", "moosewood", "moosey", "musketoon", "mycetozoon", "niggergoose", "noon", "noonday", "noonflower", "nooning", "noonlight", "noonlit", "noonstead", "noontide", "noontime", "noonwards", "noose", "nooser", "octoon", "octoroon", "oons", "oont", "overfestoon",
  "overloose", "oversoon", "pameroon", "pantaloon", "pantalooned", "pantaloonery", "pantaloons", "pantoon", "papoose", "papooseroot", "patroon", "patroonry", "patroonship", "philozoonist", "phytozoon", "picaroon", "pickaroon", "platoon", "poltroon", "poltroonery", "poltroonish", "poltroonishly", "poltroonism",
  "polyzoon", "pontoon", "pontooneer", "pontooner", "pontooning", "poon", "poonac", "poonga", "poonghie", "preafternoon", "prechoose", "proballoon", "protozoon", "protozoonal", "pseudepiploon", "puccoon", "quadroon", "quinteroon", "quintroon", "raccoon", "raccoonberry", "racoon", "ratoon", "ratooner",
  "rechoose", "recroon", "rigadoon", "roon", "saloon", "saloonist", "saloonkeeper", "saltspoon", "saltspoonful", "saskatoon", "scandaroon", "schoon", "schooner", "scoon", "semiballoon", "semiloose", "seroon", "shagroon", "shalloon", "simoon", "sirpoon", "skelgoose", "snoose", "soon", "sooner", "soonish",
  "soonly", "soupspoon", "spadroon", "spantoon", "spermatozoon", "spittoon", "spongiozoon", "spontoon", "spoon", "spoonbill", "spoondrift", "spooner", "spoonerism", "spooneyism", "spooneyly", "spooneyness", "spoonflower", "spoonful", "spoonhutch", "spoonily", "spooniness", "spooning", "spoonism",
  "spoonless", "spoonlike", "spoonmaker", "spoonmaking", "spoonways", "spoonwood", "spoony", "spoonyism", "sporozoon", "stoon", "stoond", "swoon", "swooned", "swooning", "swooningly", "swoony", "tablespoon", "tablespoonful", "tampoon", "tappoon", "teaspoon", "teaspoonful", "teleozoon", "tenoroon",
  "testoon", "tetrastoon", "toon", "toonwood", "trampoose", "trochozoon", "tycoon", "tycoonate", "typhoon", "typhoonish", "uncartooned", "undragooned", "unfestooned", "unlampooned", "unloose", "unloosen", "unloosening", "unnoosed", "unswooning", "vamoose", "vinegarroon", "walloon", "waygoose",
  "wayzgoose", "wolveboon", "woon", "woons", "xylon", "xylonic", "xylonitrile", "xylophagan", "xylophage", "xylophagid", "xylophagous", "xylophilous", "xylophone", "yesternoon", "zimbaloon", "zoon", "zoonal", "zoonerythrin", "zoonic", "zoonist", "zoonite", "zoonitic", "zoonomia", "zoonomic",
  "zoonomical", "zoonomist", "zoonomy", "zoonosis", "zoonosologist", "zoonosology", "zoonotic", "zoons", "zoonule"]
```
