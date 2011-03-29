local C = C

Window.data = {

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
			{name = "startGame", x = 32, y = 462, w = 100, h = 40, tx = 30, ty = 12},
			{name = "quitGame", x = 32, y = 512, w = 100, h = 40, tx = 30, ty = 12}
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
			{errors.log, 5, 20, 15, font.debug},
			{Queue.values.size, 5, 380, 20, font.tracker}
		},

		graphics = {
		    --{"histogram", v = love.timer.getDelta(), hist = {}, x = 10, y = 348, h = 32, w = 150}
		}

	}
}
