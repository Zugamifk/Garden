Dictionary = {
	dirt = {},
	player = {"human", "male"}

}

-- Reserved word that can't be added to the dictionary
Dictionary.RESERVED = {}

function Dictionary:new()
	return setmetatable({}, {__index = self})
end

function Dictionary:lookup(word)
	local list = {}

	-- Gets all word definitions and puts them in list as keys rather than values, to prevent repeating
	if #self[word] > 0 then
		for w in pairs(self[word]) do
			local l = self:lookup(w)
			for sw in pairs(l) do
				list[sw] = true
			end
		end
	end

	list[word] = true

	-- Creates a new table of ordered values with each word in the list
	local definition = {}

	for v in pairs(list) do
		table.insert(definition, v)
		list[v] = false
	end

	return definition
end

-- Fetches ALL data from the given word in a new table.
function Dictionary:fetchData(word)
	local data = {}
	local list = self:lookup(word)

	for w in pairs(list) do
		for k, v in pairs(self.data[w]) do
			data[oo:new(k)] = oo:new(v)
		end
	end

	return data

end

-- Adds a new term to the dictionary
-- add(word, definition, values)
function Dictionary:add(w, d, v)

	if self.RESERVED[w] or self[w] then
		return false
	else
		self[w] = d
		self.data[w] = v
		return true
	end

end

-- Loads a dictionary from a file
function Dictionary:loadFile(f)
	for line in f:lines() do

	end
end
