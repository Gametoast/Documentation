-- Table of defaults for the credit lines. Values in here are used if
-- an individual line later doesn't have the parallel entry.

CreditsDefaults = {
	str = "", -- Can be a localization database entry, or a raw string.
	font = "gamefont_small",
	yHeight = 20,
	ColorR = 255,
	ColorG = 255,
	ColorB = 255,

	ySpeed = 40, -- pixels/second. Used by *ALL* entries.
}

-- Credits, one sub-table per entry.
CreditLines = {
	{}, -- MUST START WITH BLANK LINE. Thank you.


	{ str = "STAR WARS", font = "gamefont_large", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{ str = "BATTLEFRONT", font = "gamefont_large", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, -- blank line
	{}, -- blank line
	{}, -- blank line
	{}, -- blank line
	{ str = "PANDEMIC STUDIOS, LLC", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, -- blank line
	{ str = "ifs.credits.director", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Eric 'Giz' Gewirtz", },
	{}, 
	{ str = "ifs.credits.production", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Marc Turndorf", },
	{}, 
	{ str = "ifs.credits.producer", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 	
	{ str = "Chris Williams", },
	{}, 
	{ str = "ifs.credits.leadprogrammers", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Dan Andersson", },
	{ str = "John Northan", },
	{},
	{ str = "ifs.credits.leaddesigner", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Jens Andersen", },
	{},
	{ str = "ifs.credits.leadartists", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Dean Betton", },
	{ str = "Matthew Palmer", },
	{ str = "Juan Sanchez", },
	{}, 
	{ str = "ifs.credits.programmers", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Chris Baker", },
	{ str = "Adam Batters", },
	{ str = "Steven Duan", },
	{ str = "Chris Fandrich", },
	{ str = "David Givone", },
	{ str = "Nathan Mates", },
	{ str = "Stewart Miles", },
	{ str = "Ken Miller", },
	{ str = "Salah Nouri", },
	{ str = "Brad Pickering", },
	{ str = "Jason Scanlin", },
	{ str = "Josh Verrall", },
	{ str = "Greg Walker", },
	{},
	{ str = "ifs.credits.designers", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Paul Baker", },
	{ str = "Chris Fusco", },
	{ str = "Joe Shackelford", },
	{ str = "Dellekamp Siefert", },
	{},
	{ str = "ifs.credits.artists", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Chris 'Miggles' Arden", },
	{ str = "Moon K. Bae", },
	{ str = "Walter Cosico", },
	{ str = "Sungpil 'Allen' Im", },
	{ str = "Robert Keenan", },
	{ str = "Chris McGee", },
	{ str = "Tom Mysliwiec", },
	{ str = "Bryan Norton", },
	{ str = "Graham Traynor", },
	{ str = "Scott White", },
	{}, 
	{ str = "ifs.credits.executiveproducer", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 	
	{ str = "Greg Borrud", },
	{}, 
	{ str = "ifs.credits.associateproducer", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "David Baker", },
	{ str = "Phillip Hong", },
	{},  
	{ str = "ifs.credits.designconsultant", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Trey Watkins", },
	{},  
	{ str = "ifs.credits.additionalprog", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Robert Blum", },
	{ str = "Steve Brookenthal", },
	{ str = "Gregorios Leach", },
	{ str = "Steve Marton", },
	{ str = "Adam Pino", },
	{ str = "Jeromy Walsh", },
	{}, 
	{ str = "ifs.credits.additionaldes", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Dax Berg", },
	{}, 
	{ str = "ifs.credits.additionalart", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Tyronne Bramley", },
	{ str = "Christopher Hunt", },
	{ str = "Scott Hyman", },
	{ str = "Andrew Krelle", },
	{ str = "R.C. Montesquieu", },
	{ str = "Caragh O'Connor", },
	{ str = "Huan Phan", },
	{ str = "Timo Pihlajamaki", },
	{ str = "C.J. Sarachene", },
	{ str = "Sean Sullivan", },
	{}, 
	{ str = "ifs.credits.ceo", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Andrew Goldman", },
	{}, 
	{ str = "ifs.credits.president", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Josh Resnick", },
	{}, 
	{ str = "ifs.credits.executiveartdir", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Carey Chico", },
	{}, 
	{ str = "ifs.credits.directorofhr", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Tina Cruz", },
	{}, 
	{ str = "ifs.credits.directorops", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Joseph Donaldson", },
	{}, 
	{ str = "ifs.credits.prodsupport", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Mario Cabrera", },
	{ str = "Sean Hendon", },
	{ str = "Tim McMahon", },
	{ str = "Kent Schuelke", },
	{ str = "Micheal Smith", },
	{}, 
	{ str = "ifs.credits.leadtester", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Ethan Levy", },
	{}, 
	{ str = "ifs.credits.interns", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Fred Badlissi", },
	{ str = "Todd Bergman", },
	{ str = "Laura Cabrera", },
	{ str = "Josh Cole", },
	{ str = "Robert Cordova", },
	{ str = "Adam Davis", },
	{ str = "Manuel Diaz", },
	{ str = "Rob Finney", },
	{ str = "Nick Fofi", },
	{ str = "Greg Foster", },
	{ str = "Jason Hammer", },
	{ str = "Christopher Hong", },
	{ str = "Ryan James", },
	{ str = "Greg Johnson", },
	{ str = "Dyllan Lu", },
	{ str = "Marshall Miller", },
	{ str = "Kevin Minne", },
	{ str = "Ricky Monge", },
	{ str = "Mike Robinson", },
	{ str = "Eddie Rojas", },
	{ str = "Ryan Rubianes", },
	{ str = "John St. John", },
	{ str = "Eric Trenchard-Smith", },
	{ str = "Dean Tsai", },
	{ str = "Phuc Van Dinh", },
	{ str = "Ian Vasquez", },
	{ str = "Ivan Vasquez", },
	{ str = "Brian Warrington", },
	{ str = "Mike Zaimont", },
	{}, 
	{ str = "ifs.credits.additionalcode", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Quarium, Inc.", },
	{ str = "Bart Besseling", },
	{ str = "Rod Ang", },
	{}, 
	{ str = "ifs.credits.interfacedesign", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "1K Studios", },
	{ str = "Marco Bacich", },
	{ str = "Nick Di Napoli", },
	{ str = "Nicholas Howard", },
	{}, 
	{ str = "ifs.credits.specialthanks", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Dave Betton", },
	{ str = "Matt Kennedy", },
	{ str = "David Rovin", },
	{ str = "Art Santos", },
	{},
	{},
	{},
	{ str = "LUCASARTS ENTERTAINMENT", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{ str = "A DIVISION OF LUCASFILM LTD.", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "ifs.credits.producers", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Jim Tso", },
	{ str = "Dan Pettit", },
	{ str = "Rachel Bryant", },
	{}, 
	{ str = "ifs.credits.assistantproducer", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "David 'Rogue' Silverstein", },
	{}, 
	{ str = "ifs.credits.supervisingproducer", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Peter Hirschmann", },
	{}, 
	{ str = "ifs.credits.leadtesters", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Chane Doc Hollander", },
	{ str = "K.C. Coleman", },
	{}, 
	{ str = "ifs.credits.assistantleadtesters", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Jeffrey 'Gypsy' Gullett", },
	{ str = "Matt Rubenstein", },
	{ str = "Patrick 'Krak0r' Bratton", },
	{}, 
	{ str = "ifs.credits.qatesters", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Adam Goodwin", },
	{ str = "Ahmad Abbott", },
	{ str = "Brandon Hutt", },
	{ str = "Brianna 'Bree' Woodward", },
	{ str = "Catherine 'Cattack' Sheu", },
	{ str = "Christopher Gross", },
	{ str = "Chris 'Sleepy Ghost' Navarro", },
	{ str = "Chris Thomas", },
	{ str = "Chris 'Mantroid' Ward", } ,
	{ str = "Diarmuid C. Bossé", },
	{ str = "Gregory 'Pappypants' Quinones", },
	{ str = "Heath 'Chief' Sutherland", },
	{ str = "Henry Hall", },
	{ str = "Ian Parham", },
	{ str = "J.D. 'Trouble Maker' Diaz", },
	{ str = "James Morris", },
	{ str = "Jeff Sanders", },
	{ str = "Jonny Rice", },
	{ str = "Julian James", },
	{ str = "Justin Van Alstyne", },
	{ str = "Mark Montuya", },
	{ str = "Michael Roland", },
	{ str = "Mike 'EmDub' Ward", },
	{ str = "Nicolas Sanford", },
	{ str = "Orion Tiller", },
	{ str = "Ray Vasquez", },
	{ str = "Robin Schriebman", },
	{ str = "Ryan Adza", },
	{ str = "Seth 'Schwarzkommando' Benton", },
	{ str = "Sony Green", },
	{ str = "Troy Sims", },
	{ str = "Xavier 'Bad Luck' Rodriguez", },
	{ str = "Yobo Shen", },
	{ str = "Zak Huntwork", },
	{}, 
	{ str = "ifs.credits.compliancelead", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{},
	{ str = "David Chapman", },
	{},
	{ str = "ifs.credits.compliance", font = "gamefont_medium", yHeight = 45, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Davey Lei", },
	{ str = "Ian Wolfard", },
	{ str = "Joe Acedillo", },
	{ str = "John Lowenthal", },
	{ str = "Sarah Cherlin", },
	{ str = "Shinichiro Ohyama", },
	{}, 
	{ str = "ifs.credits.internationalproducers", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Hiromi Okamoto", },
	{ str = "Huan-Hua Chye", },
	{}, 
	{ str = "ifs.credits.internationalqalead", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{},
	{ str = "Matt Chang", },
	{ str = "Phillip Berry", },
	{},
	{ str = "ifs.credits.internationalqa", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Erik Heitmeyer", },
	{ str = "Erik Lampi", },
	{ str = "Gabriel Bootz", },
	{ str = "Gary Chew", },
	{ str = "Gregory Frank", },
	{ str = "Jason Pimentel", },
	{ str = "Ken Balough", },
	{}, 
	{ str = "ifs.credits.compatibilitysupervisor", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Lynn Taylor", },
	{}, 
	{ str = "ifs.credits.compatibilitylead", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Darryl Cobb", },
	{}, 
	{ str = "ifs.credits.compatibilitytechnicians", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Ben Estabrook", },
	{ str = "Brian G. Deksnys", },
	{ str = "Dan Martinez", },
	{ str = "David Fleming", },
	{ str = "Isaiah Webb", },
	{ str = "Jason Lee", },
	{ str = "John T. Shields", },
	{ str = "Kim Jardin", },
	{ str = "Kristie Lauborough", },
	{ str = "Lester Siat", },
	{ str = "Scott Taylor", },
	{ str = "Thad Youngquist", },
	{}, 
	{ str = "ifs.credits.enzymelabs", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "We Alex Zhu", },
	{ str = "Simon Sabourin", },
	{ str = "Nick Alary", },
	{ str = "Eric Beaudin", },
	{ str = "Honghua Chen", },
	{ str = "Martin Dodier", },
	{ str = "Stéphane Guérin", },
	{ str = "Guellaume Jolicoeur", },
	{ str = "Jonathan Baron Lanteigne", },
	{ str = "Raphael Lesage", },
	{ str = "Julie Parent", },
	{ str = "Robert Quinn", },
	{ str = "Maxime Sabourin", },
	{ str = "Hugo St-Lauren", },
	{}, 
	{ str = "ifs.credits.qualityman", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Paul Purdy", },
	{}, 
	{ str = "ifs.credits.qasupervisor", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Chuck McFadden", },
	{}, 
	{ str = "ifs.credits.qualityservices", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "John Carsey", },
	{}, 
	{ str = "ifs.credits.buildengineer", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Colin Carley", },
	{}, 
	{ str = "ifs.credits.launcherinstallprog", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Charlie Smith", },
	{ str = "Dennis Crowley", },
	{}, 
	{ str = "ifs.credits.sounddesign", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Nick Peck", },
	{}, 
	{ str = "ifs.credits.addsounddesign", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Andrew Cheney", },
	{ str = "Jim Diaz", },
	{}, 
	{ str = "ifs.credits.foleyrecordedat", font = "gamefont_small", yHeight = 60, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "ifs.credits.foleyrecordist", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Pepe Merel", },
	{}, 
	{ str = "ifs.credits.foleyartist", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Ellen Heuer", },
	{ str = "Marnie Moore", },
	{}, 
	{ str = "ifs.credits.foleyassist", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "George Peterson Jr.", },
	{}, 
	{ str = "ifs.credits.musicediting", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Peter McConnell", },
	{}, 
	{ str = "ifs.credits.origstarwarssfx", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Ben Burtt", },
	{}, 
	{ str = "ifs.credits.origswmusic", font = "gamefont_small", yHeight = 60, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "ifs.credits.origswmusiclegal", font = "gamefont_small", yHeight = 90, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "ifs.credits.voiceintldeptmanager", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Darragh O'Farrell", },
	{}, 
	{ str = "ifs.credits.voDirector", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Will Beckman", },
	{}, 
	{ str = "ifs.credits.leadvoiceeditor", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Harrison Deutsch", },
	{}, 
	{ str = "ifs.credits.asstvoiceeditor", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "G.W. Childs", },
	{}, 
	{ str = "ifs.credits.voiceintlcoordinator", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Jennifer Sloan", },
	{}, 
	{ str = "ifs.credits.cast", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "ifs.credits.chriscox", yHeight = 70,},
	{ str = "ifs.credits.davidcollins", yHeight = 50,},
	{ str = "ifs.credits.davidrobb", yHeight = 50,},
	{ str = "ifs.credits.gwchilds", yHeight = 50,},
	{ str = "ifs.credits.nickjamison", yHeight = 50,},
	{ str = "ifs.credits.temuramorrison", yHeight = 50,},
	{ str = "ifs.credits.tomkane", yHeight = 50,},
	{}, 
	{ str = "ifs.credits.prodmarkmanager", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "David Zemke", },
	{}, 
	{ str = "ifs.credits.seniormarkcoordinator", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Chris Susen", },
	{}, 
	{ str = "ifs.credits.publicrelations", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Anne Marie Stein", },
	{ str = "Hadley Fitzgerald", },
	{ str = "Jason Andersen", },
	{}, 
	{ str = "ifs.credits.saleschannelmarketing", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Alyxandra Huynh", },
	{ str = "Gemma Baiocchi", },
	{ str = "Greg Robles", },
	{ str = "Katy Walden", },
	{ str = "Meredith Cahill", },
	{ str = "Mike Maguire", },
	{ str = "Terri Dome", },
	{ str = "Tim Moore", },
	{}, 
	{ str = "ifs.credits.internetmarketing", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Chris Adams", },
	{ str = "Jim Passalacqua", },
	{ str = "Michelle Martinez", },
	{ str = "Paul Warner", },
	{}, 
	{ str = "ifs.credits.externalartdirector", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Matt Omernick", },
	{}, 
	{ str = "ifs.credits.additionalart", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Ashot Melkumov", },
	{ str = "Michael Cottam", },
	{}, 
	{ str = "ifs.credits.contentcoordinator", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Ryan Kaufman", },
	{}, 
	{ str = "ifs.credits.lucaslicensing", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Chris Gollaher", },
	{ str = "Howard Roffman", },
	{ str = "Kristi Kaufman", },
	{ str = "Stacy Arnold", },
	{ str = "Stacy Cheregotis", },
	{}, 
	{ str = "ifs.credits.manualwriting", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Matthew Keast", },
	{}, 
	{ str = "ifs.credits.prodsupportsupervisor", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Jay Geraci", },
	{}, 
	{ str = "ifs.credits.burninggoddesses", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Kellie Walker", },
	{ str = "Wendy Kaplan", },
	{}, 
	{ str = "ifs.credits.masterlab", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Eric Rauch", },
	{ str = "Jay Tye", },
	{}, 
	{ str = "ifs.credits.gamespy", font = "gamefont_medium", yHeight = 150, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "ifs.credits.bink", font = "gamefont_medium", yHeight = 60, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Lua 4.0", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{ str = "Copyright © 1994-2002 Tecgraf, PUC-Rio.", font = "gamefont_small", yHeight = 30,},

	{ str = "Permission is hereby granted, without written agreement and without license or royalty fees, to use, copy, modify, translate, and distribute this software and its documentation (hereby called the \"package\") for any purpose, including commercial applications, subject to the following conditions:", font = "gamefont_small", yHeight = 140, },
	{ str = "- The above copyright notice and this permission notice shall appear in all copies or substantial portions of this package.", font = "gamefont_small", yHeight = 60,},
	{ str = "- The origin of this package must not be misrepresented; you must not claim that you wrote the original package. If you use this package in a product, an acknowledgment in the product documentation would be greatly appreciated (but it is not required).", font = "gamefont_small", yHeight = 110,},
	{ str = "- Altered source versions must be plainly marked as such, and must not be misrepresented as being the original package.", font = "gamefont_small", yHeight = 60,  },
	{ str = "The authors specifically disclaim any warranties, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The package provided hereunder is on an \"as is\" basis, and the authors have no obligation to provide maintenance, support, updates, enhancements, or modifications. In no event shall Tecgraf, PUC-Rio, or the authors be held liable to any party for direct, indirect, special, incidental, or consequential damages arising out of the use of this package and its documentation.", font = "gamefont_small", yHeight = 240, },
	{}, 
	{ str = "ifs.credits.zlib", font = "gamefont_medium", yHeight = 90, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "ifs.credits.expat", font = "gamefont_medium", yHeight = 300, ColorR = 255, ColorG = 255, ColorB = 0,},
	{ str = "ifs.credits.expat2", font = "gamefont_medium", yHeight = 210, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "ifs.credits.libpng", font = "gamefont_medium", yHeight = 90, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "ifs.credits.specialthanks", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Andy Alamano", },
	{ str = "Anne Marie Hawkins", },
	{ str = "Atsuko Matsumoto", },
	{ str = "Brent Oster", },
	{ str = "Bret Mogilefsky", },
	{ str = "Brett Rector", },
	{ str = "Brett Tosti", },
	{ str = "Camela McLanahan", },
	{ str = "Catherine Durand", },
	{ str = "Cedric Bermond", },
	{ str = "Chad Williams", },
	{ str = "Chris McAllister", },
	{ str = "Daryll Jacobson", },
	{ str = "Denise Gollaher", },
	{ str = "Donna Czerwinski", },
	{ str = "Eric Johnston", },
	{ str = "Emily Duval", },
	{ str = "Evelyne Bolling", },
	{ str = "Gabriel McDonald", },
	{ str = "Geoff Audy", },
	{ str = "Glen Kiser", },
	{ str = "Greg Rosenfeld", },
	{ str = "Haden Blackman", },
	{ str = "James Miller", },
	{ str = "Jannett Shirley-Paul", },
	{ str = "Jason Horstman", },
	{ str = "Jeff Kliment", },
	{ str = "Jim Ward", },
	{ str = "John Knowles", },
	{ str = "Josh Lowden", },
	{ str = "Jon Manahan", },
	{ str = "Jon Rodgers", },
	{ str = "Keely Brenner", },
	{ str = "Kevin Kurtz", },
	{ str = "Kyle Ruddick", },
	{ str = "Lynne Gura", },
	{ str = "Mark Barbolak", },
	{ str = "Mark DeLoura", },
	{ str = "Mary Beth Ratto", },
	{ str = "Mary Bihr", },
	{ str = "Mary Carter", },
	{ str = "Matt Urban", },
	{ str = "Matt White", },
	{ str = "Michael Klima", },
	{ str = "Mike Gallo", },
	{ str = "Mike Minahan", },
	{ str = "Mike Nelson", },
	{ str = "Peggy Ary", },
	{ str = "Peter Whiteside", },
	{ str = "Randy Breen", },
	{ str = "Rick Dean", },
	{ str = "RJ Berg", },
	{ str = "Ron O'Hara", },
	{ str = "Sandi Manesis", },
	{ str = "Sarah Ewing", },
	{ str = "Scott Call", },
	{ str = "Sean O'Connor", },
	{ str = "Seth Steinberg", },
	{ str = "Sky Schultz", },
	{ str = "Steve Sansweet", },
	{ str = "Susen Leahy", },
	{ str = "Tim Ponting", },
	{ str = "Tippy Bushkin", },
	{ str = "Tom Warner", },
	{ str = "Van Ling", },
	{ str = "Victor Fajardo", },
	{ str = "Victor Tancredi", },
	{}, 
	{ str = "ifs.credits.qaspecialthanks", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "Adeline Cochran", },
	{ str = "Alicia Lakomski", },
	{ str = "Chelsea Taylor", },
	{ str = "Eric Knudson", },
	{ str = "Jason Lauborough", },
	{ str = "Jen Goudey", },
	{ str = "Jennifer Luna", },
	{ str = "Johnny Szary", },
	{ str = "Kim Anderman", },
	{ str = "Mike Blair",},
	{ str = "Parrish Navarro",},
	{ str = "Richard Quinones Sr.", },
	{ str = "Trisha Beltz", },
	{ str = "Vanessa Jardin", },
	{ str = "Vinea", },
	{ str = "Wilwarin", },
	{ str = "Yerba Mate", },
	{ str = "Bob McGehee", },	
	{ str = "Christina 'Putting up with Adam' Newell", yHeight = 20,},
	{ str = "Hailey Anne & Rhonda, Love Ya!", },
	{ str = "Kellie and Wendy", },
	{ str = "Little man Seth Hollander", },
	{ str = "Ms. Amanda Ganley", },
	{ str = "Rachel, Ryan and the Rowland Crew", },
	{ str = "Ray behind the Grill", },
	{ str = "Seth and Tammy Chang", },
	{ str = "Steff, for dealing with the long hours", yHeight = 20,},
	{ str = "The Abbott Family, Kollar Family, and Allison Zimmerman", yHeight = 40,},
	{ str = "The Coleman family and all my friends", yHeight = 20,},
	{ str = "The Shields family in PA and AK", },
	{ str = "The Ward family and Shannon Coulter", yHeight = 30,},
	{}, 
	{ str = "ifs.credits.veryspecialthanks", font = "gamefont_medium", yHeight = 30, ColorR = 255, ColorG = 255, ColorB = 0,},
	{}, 
	{ str = "George Lucas", },
	{}, 
}

-- Sets one line. iLineIdx is the internal line index onscreen (1=
-- topmost line), iCreditEntry is the entry on the credits list (1 =
-- first line).
function ifs_credits_fnSetLine(this,iLineIdx,iCreditEntry)
	local MaxEntry = getn(CreditLines)
	if((iCreditEntry < 1) or (iCreditEntry > MaxEntry)) then
		iCreditEntry = 1 -- go to safe (blank) line
	end

	local Name = format("l%d",iLineIdx)
	IFText_fnSetFont(this.Lines[Name],CreditLines[iCreditEntry].font or CreditsDefaults.font)
	IFText_fnSetString(this.Lines[Name],CreditLines[iCreditEntry].str or CreditsDefaults.str)
	local ColorR = CreditLines[iCreditEntry].ColorR or CreditsDefaults.ColorR
	local ColorG = CreditLines[iCreditEntry].ColorG or CreditsDefaults.ColorG
	local ColorB = CreditLines[iCreditEntry].ColorB or CreditsDefaults.ColorB
	IFObj_fnSetColor(this.Lines[Name],ColorR,ColorG,ColorB)
	IFObj_fnSetPos(this.Lines[Name],this.fTextX,this.Lines[Name].y)

	-- Set y-position of next line (if it exists)
	if(iLineIdx < this.iMaxLines) then
		local NameNext = format("l%d",iLineIdx + 1)
		this.Lines[NameNext].y = this.Lines[Name].y + (CreditLines[iCreditEntry].yHeight or CreditsDefaults.yHeight)
	end
end

-- Reads this.iTopLine, sets all lines. Entries are spaced off the top
-- entry's y-position
function ifs_credits_fnSetAllLines(this)
	local i
	
	-- Be extra nice to glyphcache (disabled as it seems to increase the
	-- load on the PS2)

-- 	for i=1,this.iMaxLines do
-- 		local Name = format("l%d",i)
-- 		IFText_fnSetString(this.Lines[Name],"")
-- 	end

	for i=1,this.iMaxLines do
		ifs_credits_fnSetLine(this,i,this.iTopLine + i)
	end
end

function ifs_credits_fnUpdate(this, fDt)
	local dy = fDt * CreditsDefaults.ySpeed

	-- Advance a line when the second entry is partly off the top of the
	-- screen (and therefore the first entry must be 100% off the
	-- screen)
	if(this.Lines.l2.y < 0) then
		this.Lines.l1.y = this.Lines.l2.y - dy
		this.iTopLine = this.iTopLine + 1
		ifs_credits_fnSetAllLines(this)

		if(this.iTopLine > getn(CreditLines)) then
			ScriptCB_PopScreen()
		end
	else
		-- Top line isn't 100% off. Just scroll all entries up
		local i
		for i=1,this.iMaxLines do
			local Name = format("l%d",i)
			this.Lines[Name].y = this.Lines[Name].y - dy
			
			IFObj_fnSetPos(this.Lines[Name],this.fTextX, this.Lines[Name].y)
		end
	end
end


ifs_credits = NewIFShellScreen {
	bNohelptext_accept = 1,

	Lines = NewIFContainer {
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		UseSafezone = 0,
		rotX = 40,
		zpos = 200
	},
    
    movieIntro      = nil,
    movieBackground = nil,

	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd)

		-- Kill the really big Gamespy text on XBox
		local i
		for i=1,getn(CreditLines) do
			if((CreditLines[i].str) and (CreditLines[i].str == "ifs.credits.gamespy")) then
				if(gPlatformStr == "XBox") then
					CreditLines[i].str = ""
					CreditLines[i].yHeight = 1
				else
					if(ScriptCB_GetLanguage() ~= "english") then
						CreditLines[i].yHeight = 200
					end
				end
			end
		end

		-- Start items so that the first entry is near the bottom of the screen
		local r,b,v
		r,b,v=ScriptCB_GetSafeScreenInfo()
		this.iTopLine = -floor(b / CreditsDefaults.yHeight)

		this.Lines.l1.y = 0 -- set first entry to top of screen
		ifs_credits_fnSetAllLines(this)
	end,
	

	Update = function(this, fDt)
		-- Call base class functionality
		gIFShellScreenTemplate_fnUpdate(this, fDt)
		ifs_credits_fnUpdate(this, fDt)
	end,

	-- Overrides for most input handlers, as we want to do nothing
	-- when this happens on this screen.
	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end
	end,
	Input_GeneralLeft = function(this)
	end,
	Input_GeneralRight = function(this)
	end,
	Input_GeneralUp = function(this)
	end,
	Input_GeneralDown = function(this)
	end,
}

function ifs_credits_fnBuildScreen(this)
	-- Ask game for screen size, fill in values
	local r,b,v,w=ScriptCB_GetScreenInfo()
	local sr,sb
	sr,sb=ScriptCB_GetSafeScreenInfo()
	sr = sr * 0.7 -- angle on text blows things out of safezone by a mile, must compensate
	this.fScreenB = b
	this.iMaxLines = floor(b / CreditsDefaults.yHeight) + 5
	this.fTextX = (r*w - sr) * 0.5 -- center text within safezone

	local i
	for i=1,this.iMaxLines do
		local Name = format("l%d",i)
		this.Lines[Name] = NewIFText { 
			halign = "hcenter",
			halign = "top",
			textw = sr, 
			texth = CreditsDefaults.yHeight * 20, -- Gamespy text is HUUUGE
			nocreatebackground = 1,
		}
	end
end

ifs_credits_fnBuildScreen(ifs_credits) -- programatic chunks
ifs_credits_fnBuildScreen = nil
AddIFScreen(ifs_credits,"ifs_credits")
