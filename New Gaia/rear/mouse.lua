local Window = Window
local button = button
local Queue = Queue

Mouse = {

	x, y = 0, 0,

	context = "void",
	
	bounds = {
		window = {},
		button = {}
	}

}

function Mouse:getContext()

 	self.bounds = self:getBounds()
 	
	for i, b in ipairs(self.bounds.window) do
	    if self.x > b[1]
	    or self.y > b[2]
	    or self.x < b[3]
	    or self.y < b[4]
	    then
	        self.context = "window"
			Message = self.context
	    end
	end

end

function Mouse:getBounds()

	local newBounds = {}
	local newWindow = {}
	local newButton = {}
	
	for v in pairs(Window.known.open) do
	    if v.tracks then
	        local newEdges = { v.x, v.y, v.x + v.w, v.y + v.h }
			table.insert(newWindow, newEdges)
		end
		
		if v.buttons then
		    for i, b in ipairs(v.buttons) do
		        local newBEdges = { b.x, b.y, b.x + b.w, b.y + b.h }
		        table.insert(newButton, newBEdges)
		    end
		end
	end
	
	newBounds.window = newWindow

	return newBounds

end