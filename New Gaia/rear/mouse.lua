Mouse = {

	x = love.mouse.getX(),
	y = love.mouse.getY(),

	contextTable = {},
	context = "void",
	contextName = "nuffin",

	bounds = {
		window = {},
		button = {}
	}

}

function Mouse:getContext()

	self.x, self.y = love.mouse.getPosition()

	self.bounds.window = self:getBounds(1)

	local inWindow = false
	for i, b in ipairs(self.bounds.window) do
	    if self.x > b[1]
		and self.y > b[2]
	    and self.x < b[3]
	    and self.y < b[4]
	    then
	        inWindow = b[5]
			contextTable = b
	    end
	end

	if inWindow then
		self.context = "window"
		self.contextName = inWindow

		self.bounds.button = self:getBounds(2, Window.data[inWindow])

		for i, b in ipairs(self.bounds.button) do
			if self.x > b[1]
			and self.y > b[2]
			and self.x < b[3]
			and self.y < b[4]
			then
				self.context = "button"
				self.contextName = b[6]
				contextTable = b
			end
		end
	else
		self.context = "void"
	end

end

function Mouse:getBounds(c, w)

	local newBounds = {}

	--	Get window boundaries
	if c == 1 then
		for n, v in pairs(Window.known.open) do
			if v.tracks then
				table.insert(newBounds, { v.x, v.y, v.x + v.w, v.y + v.h, n })
			end

		end

	-- Getin button boundaries
	elseif c == 2 then
		if w.buttons then
			for i, b in ipairs(w.buttons) do
				local b = setmetatable(b, {__index = button.data[b.name]})
				table.insert(newBounds, {b.x, b.y, b.x + b.w, b.y + b.h, b.job, b.name})
			end
		end
	end
	return newBounds

end

function Mouse:click()

	if self.context == "button" then
		Queue:push(contextTable[5])

		Console:add("buttonPushed", {self.contextName, contextTable[5]})
	end

end

function Mouse:toString()

	local s = {}

	table.insert(s, "Mouse.x = "..self.x.." Mouse.y = "..self.y)
	table.insert(s, "Context: "..self.context)

	return s
end
