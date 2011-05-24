require('physics.lua')

function love.load()
	physics = physics:new():init()

	love.graphics.setBackgroundColor(104, 136, 248)
	love.graphics.setMode(650, 650, false, true, 0)

end

function love.update(dt)
	physics.world:update(dt)
	local bodies = physics.bodies
  if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
    bodies[1]:applyForce(400, 0)
  elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
    bodies[1]:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then --press the up arrow key to set the ball in the air
    bodies[1]:applyForce(0, -700)
  end
end

function love.draw()
	love.graphics.setColor(72, 160, 14)

	love.graphics.rectangle("fill", 0, 0, 650, 625)

	love.graphics.setColor(193, 47, 14)
	local rB, rS = physics.bodies[1], physics.shapes[1]
	love.graphics.circle("fill", rB:getX(), rB:getY(), rS:getRadius(), 20)

end

function CO(f)

end
