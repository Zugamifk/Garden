local C = C

Window.data = {
	
	mainMenu = {
	    tracks = true,
	    
	    width = 200,
	    height = 600,
	    
	    x = 0,
	    y = 0,
	    
	    drawType = "colour",
		BGcolour = C:colours("w"),
		Ecolour = C:colours("tp"),
		Tcolour = C:colours("gray"),
		
		buttons = {
			{name = "quitGame", x = 32, y = 512, w = 100, h = 40, tx = 30, ty = 12}
		}
	},
	
	debug = {
	    tracks = false,

		width = 250,
		height = 400,
		
		x = 550,
		y = 0,
		
  	    drawType = "colour",
		BGcolour = C:colours("ow"),
		Ecolour = C:colours("b"),
		Tcolour = C:colours("b"),
		text = {
			{error.log, 5, 20, 15, 8},
			{Queue.values.size, 5, 380, 20, 12}
		},
		
		graphics = {
		    {"histogram", v = love.timer.getDelta(), hist = {}, x = 10, y = 348, h = 32, w = 150}
		}

	}
}