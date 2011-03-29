Map = {
	raw = {},
	objects = {},
	tiles = {},
	conf = {
		size = 100
	}
}

function Map:new()

	local newMap = {tiles = {}}

	for x = 1, self.conf.size do
		newMap.tiles[x] = {}
		for y = 1, self.conf.size do
			newMap.tiles[x][y] = Tile:new()
		end
	end

	setmetatable(newMap, {__index = self})

	Console:add("mapCreate", newMap)

	return newMap

end

function Map:loadFile(f)

	local fs = love.filesystem
	local success = false
	if fs.exists(f) then
		local f = fs.newFile(f)
		f:open('r')
		for line in f:lines() do
			table.insert(self.raw, line)
		end
		success = f:close()
	else
		local f = fs.newFile(f)
		f:open('w')
		for i = 1, 100 do
			f:write("dirt".."\r\n")
		end
		success = f:close()
	end

	Console:add("mapLoaded", f)
	return success

end
