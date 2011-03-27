function love.load()
	love.filesystem.load('loader.lua')()
	
	Message = "Hello World"
	
	Queue:push(1980000)
	Queue:push(1980001)
	
	Window:toggle("happy")
	Window:toggle("mainMenu")
	
	x = 400
	y = 300
end


function love.update(dt)
	
	dt = love.timer.getDelta()
	
	

end


function love.draw()
    Queue:push(1100001)
	Queue:operate()
	
	love.graphics.setFont(12)
	
    love.graphics.print(Message, x, y)
	Draw:cursor()
    
end

function love.keypressed(key)
	if key == "a" then Queue:push(1980000) end
	if key == "s" then Queue:push(3980001) end
	if key == "q" then Queue:push(0990000) end
	if key == "d" then Queue:push(1210000) end
end