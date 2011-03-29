love.filesystem.load('rear/queue.lua')()
love.filesystem.load('rear/taskCodes.lua')()

love.filesystem.load('rear/errors.lua')()
love.filesystem.load('rear/console.lua')()
		    
Queue:push(0000000)

Queue:operate()