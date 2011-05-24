Grammar = {}

local dir = 'language/'
require(dir..'Dictionary.lua')

function Grammar:new()

	return setmetatable({}, Grammar.mt)
end

function Grammar:parse(phrase)
	local p = {}
	local k = 0

	for word in phrase:gmatch('%a+') do
		k = k + 1
		p[k] = word
	end

end
