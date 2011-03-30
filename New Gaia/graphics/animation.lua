Animation = {

}

Animation.mt = {
	__index = Animation

	-- To do: Add __concat for transitioning animations
}

-- function(image, quad, frames, sourceX, sourceY, sourceWidth, sourceHeight)
function Animation:new(i, q, f, sx, sy, sw, sh)
	local newA = {}
	setmetatable(newA, self.mt)

	self.i = i
	self.q = q
	self.f = f
	self.sx = sx
	self.sy = sy
	self.sw = sw
	self.sh = sh

	return newA

end

function Animation:update(dt)

end
