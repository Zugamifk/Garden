Console = {

	log = {},

	logsEnabled = {
		buttonPushed = true,
		keyPush = true,
		mapCreate = true,
		mapLoaded = true,
		objectCreated = true,
		push = false,
		pop = false,
		tileCreate = true

	}
}

function Console:save(name)

	local file = love.filesystem.newFile((name or "log")..".txt")

	file:open('w')

	file:write("---ERROR LOG---\r\n")
	for line, string in ipairs(errors.log) do

		file:write(string.."\r\n")

	end

	file:write("\r\n---CONSOLE LOG---\r\n")
	for line, string in ipairs(self.log) do

		file:write(string.."\r\n")

	end

	file:close()

	-- For method chaining
	return self

end

function Console:add(template, data)

	if self.logsEnabled[template] then
		local message
		if template == "buttonPushed" then
			message = "Button pressed: "..data[1].."-->"..data[2]
		elseif template == "mapCreate" then
			message = "New Map: metatable -> "..tostring(getmetatable(data))
		elseif template == "mapLoaded" then
			message = "Map loaded: "..data
		elseif template == "objectCreated" then
			message = "Object created: "..data
		elseif template == "push" then
			message = "Queue push: Job# "..data
		elseif template == "pop" then
		    message = "Queue pop: Job# "..data
		elseif template == "keyPush" then
			message = "Key pushed: "..data
		end

		table.insert(self.log, message.. "  ")

	end

	-- For method chainign
	return self

end
