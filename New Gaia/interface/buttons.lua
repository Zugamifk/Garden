button = {}

setmetatable(button, {__index = Window})

function button:new(Window, version)
	local newButton = {}
	setmetatable(newButton, {__index = self.data[version.name]})
	newButton.x = version.x
	newButton.y = version.y
	newButton.w = version.w
	newButton.h = version.h
	newButton.tx = version.tx
	newButton.ty = version.ty
	return newButton
end

function button:draw(b)
	love.graphics.setColor(unpack(b.BGcolour))
	love.graphics.rectangle("fill", b.x, b.y, b.w, b.h)
	love.graphics.setColor(unpack(b.Ecolour))
	love.graphics.rectangle("line", b.x, b.y, b.w, b.h)
	love.graphics.setColor(unpack(b.Tcolour))
	love.graphics.setFont(b.font)
	love.graphics.print(b.title, b.x + b.tx, b.y + b.ty)
end
