error = {

	interfaceNotDefined = {"Window ", " is not defined"},

	log = {}

}

function error:add(e, a)
	table.insert(self.log, self[e][1]..a..self[e][2])
end