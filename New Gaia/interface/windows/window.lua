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
	    return error:log(interface.notDefined, "\"version\"")
	else

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
	    end
	    
	end
end


function Window:toggle(version)
	local open = self.known.open[version]
	local closed = self.known.closed[version]

	if not open and not closed then
	    self.known.open[version] = self:build(version)
	else
		closed, open = open, closed
	end
end


	