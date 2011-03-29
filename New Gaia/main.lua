function love.load()
	love.filesystem.load('loader.lua')()

	Message = "Hello World"
   	x = 400
	y = 300

	Window:toggle("happy")
	Window:toggle("fart")
	Window:toggle("mainMenu")

end


function love.update()

	dt = love.timer.getDelta()

end


function love.draw()

    Queue:push(1100001):operate()

	love.graphics.setFont(font.tracker)

	love.graphics.setColor(C:colours("b"))
    love.graphics.print(Message, x, y)
	Draw:cursor()

	Mouse:getContext()

end

function love.keypressed(key)

	Console:add("keyPush", key)

	if key == "a" then Queue:push(1980000) end
	if key == "s" then Queue:push(3980001) end
	if key == "q" then Queue:push(0990000) end
	if key == "d" then Queue:push(1210000, {"debug", x = 50}) end

end

function love.mousepressed(x, y, button)

	 Queue:push(1210001)

end
