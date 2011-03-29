Console = {

	log = {},

	logsEnabled = {
		push = false,
		pop = false,
		keyPush = true

	}
}

function Console:save(name)

	local file = love.filesystem.newFile((name or "log")..".txt")

	file:open('w')

	file:write("---ERROR LOG---")
	for line, string in ipairs(error.log) do

		file:write(string.."  ")

	end

	file:write("---CONSOLE LOG---")
	for line, string in ipairs(self.log) do

		file:write(string)

	end

	file:close()

	-- For method chaining
	return self

end

function Console:add(template, data)

	if self.logsEnabled[template] then
		local message
		if template == "push" then
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
