local interface = interface
local oo = oo
Window = interface:newPrototype(interface)

Window.known = {
	open = {},
	closed = {}
}


function Window:build(version)
	local newWindow = {}
	if not self.data[version] then
	    error:add("interfaceNotDefined", version)
	    return nil
	else
		if self.data[version].buttons then
		    newWindow.text = {}
		    for i, v in ipairs(self.data[version].buttons) do
		    	newWindow.text[i] = v[1]
		    end
		end
		
		setmetatable(newWindow, {__index = self.data[version]})

		return newWindow
	end
end


function Window:draw()
	for k, v in pairs(self.known.open) do
	    if v.drawType == "colour" then
		    local w = v.width
		    local h = v.height
		    local x = v.x
		    local y = v.y
		    
	        love.graphics.setColor(unpack(v.BGcolour))
	        love.graphics.rectangle("fill", x, y, w, h)
	        love.graphics.setColor(unpack(v.Ecolour))
	        love.graphics.rectangle("line", x, y, w, h)

			love.graphics.setFont(8)
			
	        for line, string in ipairs(v.text) do
				love.graphics.printf(string, x+ 5, y + (line*10) - 7, w - 20)
	    	end
	    end
	    
	end
end


function Window:toggle(version)
	local open = self.known.open[version]
	local closed = self.known.closed[version]

	if open or closed then
     	self.known.open[version], self.known.closed[version] = closed, open
	else
	    self.known.open[version] = self:build(version)
	end
end


	