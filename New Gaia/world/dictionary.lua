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

	if #self.word > 0 then
		for w in pairs(self.word) do
			local l = self:lookup(w)
			for sw in pairs(l) do
				table.insert(list, sw)
			end
		end
	end

	table.insert(list, word)

	return list
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
