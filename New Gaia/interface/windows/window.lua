local interface = interface
local oo = oo
Window = interface:newPrototype(interface)

Window.known = {
	open = {},
	closed = {}
}


function Window:build(version, a)
	local newWindow = {}
	if self.data[version] then

		if self.data[version].buttons then
		    newWindow.text = {}
		    for i, v in ipairs(self.data[version].buttons) do
		    --	newWindow.text[i] = v[1]
		    end
		end

		setmetatable(newWindow, {__index = self.data[version] or a})
        
		return newWindow
	else
	    error:add("windowNotCreated", "windowNotDefined", version)
	    return nil
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
	            if type(string[1]) ~= "table" then
					love.graphics.printf(string[1], x + string[2], y + string[3], w - string[4])
				else
				    for l, s in ipairs(string[1]) do
						love.graphics.printf(s, x + string[2], y + (l-1)*string[3] + string[4] - 10, w - string[5])
				    end
				end
	    	end
	    end
	    
	end
end


function Window:toggle(version, a)
	local open = self.known.open[version]
	local closed = self.known.closed[version]

	if open or closed then
     	self.known.open[version], self.known.closed[version] = closed, open
	else
	    self.known.open[version] = self:build(version, a)
	end
end


	