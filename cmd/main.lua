a = {b = {x = "b"}, x = "a"}

function love.load()

end

function a.b.c(g)
	return g.x
end

function love.update()

end

function love.draw()
	love.graphics.setBackgroundColor(255, 255, 255)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print(a.b.c(a.b), 380, 300)
end
