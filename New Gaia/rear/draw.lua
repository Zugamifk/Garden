Draw = {

	--Holds images for the world
	world = {
		size = nil, -- holds tiles per side
		-- temporary tables
		t = {}, 	-- Tiles
		gs = {}, 	-- Ground surface
		g = {}, 	-- On ground
		h = {}		-- Above ground
		},
	--Holds images for the hud
	interface = {},
	--Holds images for the cursor
	cursor = {}
}

function Draw:new(s) -- (size)

	self.world.t = self:newGrid(s)
	self.world.size = s

	return setmetatable({}, {__index = self})
end

function Draw:newGrid(s)
	local newGrid = {}
	for x = 1, s do
		newGrid[x] = {}
		for y = 1, s do
			newGrid[x][y] = {}
		end
	end

	return newGrid
end

function Draw:dump()

	local s = self.world.size
	-- Test code for drawing tile images
	--[[for x = 1, s do
		for y= 1, s do
			if self.world.t[x][y] then
				love.graphics.draw(Images.world.dirt, 300, y * 35)
			else break end
		end
	end--]]
-- Draw Windows
	Queue:push(5100001)
-- Draw Cursor
-- Misc
	Queue:push(5100000)

end

function Draw:cursor()
	love.graphics.draw(Images.cursor.default, love.mouse.getPosition())
end

function Draw:drawTiles()

end

Draw = Draw:new(100)
