--[[ 
	Code format:
	1-23-4567
	1) priority
	23) job set
    	00) file manipulation
    	01) loading and saving games
    	10) drawing
    	20) Information retrieving
    	98) test shit
    	99) program operations
    4567) job uniquecode
--]]

function Queue:doTask(job)

	-- Variables to hold the job codes and its parts
	local testJob = self:getCodeChunk(job[1], "tasks")
	local jobSet = self:getCodeChunk(job[1], "jobSet")
	local jobUnique = self:getCodeChunk(job[1], "jobUnique")
	local jobPriority = self:getCodeChunk(job[1], "jobUnique")
	 
	
	-- Loading core game files
	if jobSet == 00 then

		-- Startup procedure
		if jobUnique == 0000 then
			-- Load pre-game file testing code
			love.filesystem.load('test_methods.lua')()

			Mesage = HA
			-- Load main game files
			self:push(0000001)
			self:push(0000002)

			self:push(0000005)

			-- Begin maintenance functions
			self:push(0000020)
		-- Load main game files
		elseif jobUnique == 0001 then
		    love.filesystem.load('rear/errors.lua')()
		    love.filesystem.load('rear/OOP.lua')()
		    love.filesystem.load('interface/canvas.lua')()
			love.filesystem.load('rear/draw.lua')()
			love.filesystem.load('interface/font.lua')()
			love.filesystem.load('interface/interface.lua')()
		    love.filesystem.load('interface/windows/window.lua')()
		    love.filesystem.load('interface/windows/windowData.lua')()
		    love.filesystem.load('interface/buttons.lua')()
            love.filesystem.load('interface/buttonData.lua')()
            love.filesystem.load('rear/mouse.lua')()

		-- Load image files
		elseif jobUnique == 0002 then
			love.filesystem.load('rear/Images.lua')()

		-- Set game values for start
		elseif jobUnique == 0005 then
			-- Turn off mouse visibility
			love.mouse.setVisible(false)

			-- Set default colours                                          t
			love.graphics.setColor(0,0,0,255)
   			love.graphics.setBackgroundColor(C:colours("ow"))

		-- Begin maintenance procedures
		elseif jobUnique == 0020 then
			--self:push(4200000)
		end

	-- Loading and saving games
	elseif jobSet == 01 then

	-- Drawing
	elseif jobSet == 10 then
		if jobUnique == 0000 then
			love.graphics.print(Message, 100, 100)

		--[[ DRAWING THE HUD AND MENUS --]]
		elseif jobUnique == 0001 then
			Window:draw()
		end
	--Retrieving information
	elseif jobSet == 20 then
		if jobUnique == 0000 then
		    Mouse:getContext()
		end
    	-- Interacting with the game
	elseif jobSet == 21 then

		-- For toggling windows
	    if jobUnique == 0000 then
	        local version = oo:new(job[2])
	        table.remove(job, 1)
            table.remove(job, 1)
			Window:toggle(version, job)
			
	    elseif jobUnique == 0001 then

	    end
	    
	
	elseif jobSet == 98 then

		if jobUnique == 0000 then
		
			Message = "BOO BOO BOO"
			
		elseif jobUnique == 0001 then
		
			Message = "HA HA HA"

		end
	
	
	elseif jobSet == 99 then
		-- Quits the game
		if jobUnique == 0000 then
		   	love.event.push('q')
		end
	end
	
end