dataProcess = {
	task = nil
}

function dataProcess:loadGame(task, files)
	if task == "game" then
		local M = Map:new()

		-- Will eventually load multiple variables files
		M:loadFile("map.txt")

		for v, line in pairs(M.raw) do
			M.tiles[math.ceil(v/M.conf.size)][v%M.conf.size] = Object:new(line)
		end
	end
end
