interface = {
	mt = {__index = oo},

	data = {

	}

}

-- Closes all elements of the interface and empties all built tables
function interface:empty()
	local e = function() return {} end
	Window.known.open = e()
end

setmetatable(interface, interface.mt)
