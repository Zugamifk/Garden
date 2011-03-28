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
		    newWindow.buttons = {}
		    for i, v in ipairs(self.data[version].buttons) do
				newWindow.buttons[i] = button:new(newWindow, v)
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
    	local w = v.w
	    local h = v.h
	    local x = v.x
	    local y = v.y
		    
	    if v.drawType == "colour" then
		    
	        love.graphics.setColor(unpack(v.BGcolour))
	        love.graphics.rectangle("fill", x, y, w, h)
	        love.graphics.setColor(unpack(v.Ecolour))
	        love.graphics.rectangle("line", x, y, w, h)
	        
	    end
	    
	    if v.buttons then
        	for i, b in ipairs(v.buttons) do
        	    button:draw(b)
        	end
	    end
	    
	    if v.text then

	        for line, string in ipairs(v.text) do
	            if type(string[1]) ~= "table" then
	                love.graphics.setFont(string[5])
					love.graphics.printf(string[1], x + string[2], y + string[3], w - string[4])
				else
				    for l, s in ipairs(string[1]) do
				        love.graphics.setFont(string[5])
						love.graphics.printf(s, x + string[2], y + (l-1)*string[3] + string[4] - 10, w)
				    end
				end
	    	end
	    
	    end
	    
	    if v.graphics then
	        for i, g in ipairs(v.graphics) do
	            if g[1] == "histogram" then
					local line = {}
					
					if #g.hist > g.w then
					    table.remove(g.hist)
					end
					
					for t, h in ipairs(g.hist) do
						line[t*2-1] = v.x + g.x + t
						line[t*2] = v.y + g.y - h
	                end
	                if line[1] then
	                	love.graphics.line(v.x+g.x,v.y+g.y, unpack(line))
					end
					table.insert(g.hist, g.v%g.h)
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


	