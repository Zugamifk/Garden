button = {}

setmetatable(button, {__index = Window})

function button:new(Window, version)
	local newButton = {}
	local n = function(v) local nv = v return nv end
	for k, v in pairs(version) do
		newButton[n(k)] = n(v)
	end

	return setmetatable(newButton, {__index = self.data[version.name]})
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

function button:getBounds(b)

	return b.x, b.y, b.x + b.w, b.y + b.h, b.action, b.name
end
