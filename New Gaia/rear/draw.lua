Draw = {

	--Holds images for the world
	world = {},
	--Holds images for the hud
	interface = {},
	--Holds images for the cursor
	cursor = {}
}

function Draw:dump()
	

end

function Draw:cursor()
	love.graphics.draw(Images.cursor.default, Mouse.x, Mouse.y)
end