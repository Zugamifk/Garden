love.filesystem.load('rear/queue.lua')()
love.filesystem.load('rear/taskCodes.lua')()

love.filesystem.load('rear/errors.lua')()
love.filesystem.load('rear/console.lua')()

Loader = {}

function Loader:loadPackage(package)
	if package == "main" then
		love.filesystem.load('world/dictionary.lua')()
		love.filesystem.load('world/dictionaryData.lua')()
		love.filesystem.load('world/object.lua')()
		love.filesystem.load('world/tile.lua')()
		love.filesystem.load('world/map.lua')()

	end
end
