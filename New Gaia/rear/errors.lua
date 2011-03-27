error = {

	interface = {
		notDefined = {"Window ", "is not defined"}
	},

	log = {}

}

function error:log(e, ...)
	log[1] = self.e[1]..args[1]..self.e[2]
	return log[1]
end