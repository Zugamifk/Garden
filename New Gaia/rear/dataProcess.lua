dataProcess = {
	task = nil
}

function dataProcess:loadGame(task, files)
	if task == "game" then
		local M = Map:new()

		M.conf = {size = 100}

		-- Will eventually load multiple variables files
		M:loadFile("map.txt")

		-- Put raw filedata into the map
		local x = 1
		local y = 1
		for v, line in pairs(M.raw) do

			M.tiles[x][y] = Object:new(line)

			if y > M.conf.size then y = 1; x = x + 1 end
		end

		-- Interpret filedata and process it for game use
		for x = 1, M.conf.size do
			if not M.tiles[x] then
				errors:add("dataProcessError", "dataMissing", "M.tiles["..x.."]")
				break
			end
			for y= 1, M.conf.size do
				if M.tiles[x][y] then
					Draw.world.t[x][y] =
						Images.world["dirt"]
				else
					errors:add("dataProcessError", "dataMissing", "M.tiles["..y.."]")
					break
				end
			end
		end
	end
end
