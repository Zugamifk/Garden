Draw = {

	--Holds images for the world
	world = {},
	--Holds images for the hud
	interface = {},
	--Holds images for the cursor
	cursor = {}
}

function Draw:dump()
-- Draw Windows
	Queue:push(5100001)
-- Draw Cursor
-- Misc
	Queue:push(5100000)

end

function Draw:cursor()
	love.graphics.draw(Images.cursor.default, love.mouse.getPosition())
end
