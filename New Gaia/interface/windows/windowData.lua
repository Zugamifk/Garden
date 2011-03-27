local C = C

Window.data = {
	
	mainMenu = {
	    tracks = true,
	    
	    width = 200,
	    height = 600,
	    
	    x = 0,
	    y = 0,
	    
	    drawType = "colour",
		BGcolour = C:colours("b"),
		Ecolour = C:colours("tp"),
		Tcolour = C:colours("gray"),
		
		buttons = {
			{"play"},
			{"quit", 0990000}
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
		text = error.log

	}
}