errors = {
    windowNotCreated = {
		windowNotDefined = {"Window \"", "\" is not defined."}
	},

	dataProcessError = {
		dataMissing = {"Data missing from position ", ". Likely unfinished or missing files"}
	},

	log = {}

}

function errors:add(e, r, a)
	table.insert(self.log, self:getMessage(e, r, a))
end

function errors:getMessage(e, r, a)
	return "ERROR: "..e..": "..r..":\r\n\t"..self[e][r][1]..a..self[e][r][2]
end
