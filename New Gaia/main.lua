function love.load()

	require('loader')

	Queue:push(0000000)

	Queue:operate()

end


function love.update()

	dt = love.timer.getDelta()

	Queue:operate()

end


function love.draw()

	Queue:operate(1)

	love.graphics.setFont(font.tracker)

	love.graphics.setColor(C:colours("b"))
    love.graphics.print(debugMessage(), x, y)
	Draw:cursor()

	Mouse:getContext()

end

function debugMessage()
	local s = "y="..Mouse.x.." x="..Mouse.y.." context: "..Mouse.context..": "..Mouse.contextName
	return s
end

function love.keypressed(key)

	Console:add("keyPush", key)

	if key == "a" then Queue:push(1980000) end
	if key == "s" then Queue:push(3980001) end
	if key == "q" then Queue:push(0990000) end
	if key == "d" then Queue:push(1210000, {"debug"}) end
	if key == "c" then Queue:push(1210000, {"Log"}) end
	if key == "escape" then Queue:push(1210000, {"mainMenu"}) end

end

function love.mousepressed(x, y, button)

	 Queue:push(1210001)

end
