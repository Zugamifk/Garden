error = {
    windowNotCreated = {
		windowNotDefined = {"Window \"", "\" is not defined."}
	},

	log = {}

}

function error:add(e, r, a)
	table.insert(self.log, self:getMessage(e, r, a))
end

function error:getMessage(e, r, a)
	return "ERROR: "..e..": "..r..":\r\n\t"..self[e][r][1]..a..self[e][r][2]
end
