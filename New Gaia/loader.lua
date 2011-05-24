require('rear/queue.lua')
require('rear/taskCodes.lua')

require('rear/errors.lua')
require('rear/console.lua')

require('rear/OOP.lua')
require('interface/canvas.lua')
require('rear/draw.lua')
require('interface/font.lua')
require('interface/interface.lua')
require('interface/windows/window.lua')
require('interface/windows/windowData.lua')
require('interface/buttons.lua')
require('interface/buttonData.lua')
require('rear/mouse.lua')

require('rear/Images.lua')

require('rear/dataProcess.lua')

require('world/actor.lua')

-- Load test code for debugging
require('test_methods.lua')

Loader = {}

function Loader:loadPackage(package)
	if package == "main" then
		love.filesystem.load('language/grammar.lua')()
		love.filesystem.load('world/object.lua')()
		love.filesystem.load('world/tile.lua')()
		love.filesystem.load('world/map.lua')()
	end
end
