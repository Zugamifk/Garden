Engine = {
	mapsize = 100,
	buffersize = 6,

	centrex = 50,
	centrey = 50,

	map = {},
	buffer = false
}

function Engine:new(tileData)
	local E = {}
	setmetatable(E, {__index = self})
	E.tileData = tileData

	local m = {}
	for x = 1, self.mapsize do
		m[x] = {}
		for y = 1, self.mapsize do
			m[x][y] = {}
		end
	end
	E.maps[1] = m


	return E
end

function Engine:fill(image)
	local m = self.map
	for x = 1, 100 do
		m[x] = {}
		for y = 1, 100 do
			m[x][y] = image
		end
	end
end

function Engine:buildBuffer()
	local buffer = self.buffer or self:newBuffer()

	self:bufferGetData()
end

function Engine:newBuffer()
	local t = {}
	local buffSize = self.buffersize
	for x = 1, 2*buffSize+1 do
		t[x] = {}
		for y = 1, 2*buffSize+1 do
			t[x][y] = {}
		end
	end
	return t
end

function Engine:bufferGetData()
	local ss = true
	local buffSize = self.buffersize
	local buffer = self.buffer

	for x = -buffSize, buffSize do

		for y = -buffSize, buffSize do
			buffer[x][y] = self.map[centrex - x + buffSize][centrey - y + buffSize]
		end
	end

	return ss

end
