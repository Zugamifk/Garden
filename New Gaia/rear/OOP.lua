oo = {

}

function oo:new(copyValue)

	local lookup_table = {}
	
	local function _copy()
	
	    if type(copyValue) ~= "table" then
	        return copyValue
		elseif lookup_table[copyValue] then
			return lookup_table[copyValue]
  		end
  		
  		local newTable = {}
  		
  		lookup_table[copyValue] = newTable
  		
		for i, v in pairs(copyTable) do
	        new_table[_copy(i)] = _copy(v)
		end
		
		return setmetatable(new_table, getmetatable(copyValue))
	end

	return _copy(copyValue)

end

function oo:newPrototype(copyTable, customValues)

	local newTable = {}
	
	if customValues then
		for k, v in pairs(customValues) do
		    newTable[k] = v
	 	end
	end
 	
 	setmetatable(newTable, copyTable)
	
	return newTable
end