love.filesystem.load('rear/queue.lua')()
love.filesystem.load('rear/taskCodes.lua')()

Queue:push(0000000)

Queue:operate()