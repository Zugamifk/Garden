local C = C

Window.data = {

	Log = {
		name = "Log",

		tracks = false,

		w = 250,
		h = 600,

		x = 550,
		y = 0,

	    drawType = "colour",
		BGcolour = C:colours("lgray"),
		Ecolour = C:colours("b"),
		Tcolour = C:colours("b"),

		text = {
			{Console.log, 5, 12, 15, font.debug, 590}
		}
	},

	mainMenu = {
		name = "Main Menu",

	    tracks = true,

	    w = 200,
	    h = 600,

	    x = 0,
	    y = 0,

	    drawType = "colour",
		BGcolour = C:colours("w"),
		Ecolour = C:colours("tp"),
		Tcolour = C:colours("gray"),

		buttons = {
			{name = "mainMenu", title = "Main", y = 400, job = 0020000},
			{name = "mainMenu", title = "Map Draw", tx = 12, y = 450, job = 0020001},
			{name = "mainMenu", title = "Quit", y = 500, job = 0990000}
		}
	},

	debug = {
		name = "Debug Window",

	    tracks = true,

		w = 250,
		h = 400,

		x = 550,
		y = 0,

  	    drawType = "colour",
		BGcolour = C:colours("ow"),
		Ecolour = C:colours("b"),
		Tcolour = C:colours("b"),
		text = {
			{errors.log, 5, 20, 15, font.debug, 300},
			{Queue.values.size, 5, 380, 20, font.tracker}
		}

		--graphics = {
		    --{"histogram", v = love.timer.getDelta(), hist = {}, x = 10, y = 348, h = 32, w = 150}
		--}

	}
}
