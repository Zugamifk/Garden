physics = {}

function physics:new()
	local nP = {}

	nP.world = {}
	nP.shapes = {}
	nP.bodies = {}

	setmetatable(nP, {__index = physics})

	return nP
end

function physics:init()

	local world = function ()
		local nW = love.physics.newWorld(0, 0, 800, 600)
		nW:setGravity(0, 700)
		nW:setMeter(64)
		return nW
	end
	local world = world()

	local bodies = function ()
		local nB = {}
		nB[0] = love.physics.newBody(world, 650/2, 625, 0, 0)
		nB[1] = love.physics.newBody(world, 650/2, 250/2, 5, 0)
		return nB
	end
	local bodies = bodies()

	local shapes = function ()
		local nS = {}
		nS[0] = love.physics.newRectangleShape(bodies[0], 0, 0, 650, 50, 0)
		nS[1] = love.physics.newCircleShape(bodies[1], 0, 0, 20)
		return nS
	end
	local shapes = shapes()

	self.world = world
	self.bodies = bodies
	self.shapes = shapes

	return self

end
