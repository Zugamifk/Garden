Tile = {


}

function Tile:new()
	local newTile = {}
	setmetatable(newTile, {__index = self})

	return newTile
end
