Object = {
	keyWords = {} -- Holds words used during creation. Used to get full list when needed.

}

function Object:new(args)

	local newObject = {}
	setmetatable(newObject, {__index = self})

	for a in pairs(arg) do
		-- Apply custom variables
		if type(args) == "table" then
			for i, v in pairs(args) do
				newObject[i] = v
			end
		else
			-- Add additional keywords
			table.insert(newObject.keyWords, args)
		end
	end

	Console:add("objectCreated", args[1] or args)
	return newObject

end


function Object:expand(o)


end
