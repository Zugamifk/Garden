Dictionary.mt = {

	__index = function (t, k)

	end

}

Grammar.mt = {
	__index = function (t, k)
		return Grammar[t]
	end
}

