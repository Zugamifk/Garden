Actor = {}
Actor.data = {}
Actor.mt = {}

require('world/actor_data.lua')
require('world/actor_mt.lua')

function Actor:new(name, datums)

	local a = {}

	a.name = name

	return setmetatable(a, Actor.mt)

end
