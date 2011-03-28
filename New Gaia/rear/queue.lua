Queue = {

-- These two tables hold tasks for the queue
	queues = {
		-- Regular tasks with low priority. Should encompass the majority of ingame actions.
		tasks = {}, -- Code 1
		-- Gets emptied every time it is checked
		priority = {},  -- Code 0
		-- Holds large tasks that are broken into parts. Should be enqueued in order
		buffer = {}, -- Code 2
		-- Holds recurring tasks that are done over a period of time
		period = {}, -- Code 3
		-- Holds all of the maintenance tasks such as updating variables and errorchecking
		maintenance = {}, -- Code 4
		
		-- These numbers added together equals the number of tasks to be performed
		-- before priority tasks are performed
		frequencies = {
		tasks = 5, -- Basic task frequency
		buffer = 2, -- Buffer frequency
		period = 1, -- Period frequency
		maintenance = 1 -- Maintenance frequency	
		}
	},

	-- Hold any important values for the table
	values = {
		
		-- Holds how many items are in the queue at a given time
		size = 0,
		
		-- The limit of how many tasks can be performed before operate() breaks 	
		taskLimit = 32,
		
		-- For getting chunks out of job codes, calculated by 
			-- chunk = math.floor(math.floor(code / [1]) % [2]) 
		code = {
			priority = { 1000000, 10 },
			jobSet = { 10000, 100},
			jobUnique = {1, 10000},
			tasks = { 1, 1000000 }
			}
		}
}



-- When this is called, the queue is emptied
function Queue:operate()
	local count
	local limit = self.values.taskLimit
	count = 0
	
	-- runs as long as there are tasks in the queue
	while self:hasTasks() do
	
		-- Check teh priority queue first each time
	    while self.queues.priority[1] do
	    	
	    	if count >= limit then
	    		return count
	    	end
	    	
	    	-- do an action based on its code
			self:doTask(self:pop("priority"))
			-- Remove it from the queue
			table.remove(self.queues.priority, 1)
			
			count = count + 1
			
			self.values.size = self.values.size - 1
			
		end

		-- Run basic tasks
	   	for i = 1, self.queues.frequencies.tasks do
	    	
	    	 
	    	if count >= limit then
	    		return count
	    	elseif self.queues.tasks[1] then
	    	
		    	-- do an action based on its code
				self:doTask(self:pop("tasks"))
				-- Remove it from the queue
				table.remove(self.queues.tasks, 1)
				
				count = count + 1
				
				self.values.size = self.values.size - 1
			end
			
		end
		
		-- Run buffer tasks
	   	for i = 1, self.queues.frequencies.buffer do
	    	
	    	if count >= limit then
	    		return count
	    	elseif self.queues.buffer[1] then
	    	
		    	-- do an action based on its code
				self:doTask(self:pop("buffer"))
				-- Remove it from the queue
				table.remove(self.queues.buffer, 1)
				
				count = count + 1
				self.values.size = self.values.size - 1
			end
			
		end
		
		-- Run period tasks
	   	for i = 1, self.queues.frequencies.period do
	    	
	    	if count >= limit then
	    		return count
	    	elseif self.queues.period[1] then	    	
		    	-- do an action based on its code
				self:doTask(self:pop("period"))
				-- Remove it from the queue
				table.remove(self.queues.period, 1)
				
				count = count + 1
				self.values.size = self.values.size - 1
			end
		end
		
		-- Run maintenance tasks
	   	for i = 1, self.queues.frequencies.maintenance do
	    	
	    	if count >= limit then
	    		return count
	    	elseif self.queues.maintenance[1] then
				local job = self:pop("maintenance")	    	
		    	-- do an action based on its code
				self:doTask(job)
				-- Add it to the back and remove it from the front
				table.insert(self.queues.maintenance, job)
				-- Remove it from the queue
				table.remove(self.queues.maintenance, 1)
				
				count = count + 1
				self.values.size = self.values.size - 1
			end
		end
				
	end
	
	return count
	
end

-- Checks if there are tasks in the queue
function Queue:hasTasks()

	local found = false
	
	if self.queues.tasks[1] or
		self.queues.priority[1] or
		self.queues.buffer[1] or
		self.queues.period[1] or
		self.queues.maintenance[1] then
			found = true
	end
	
	return found
end

-- Adds a job to the queue
function Queue:push(job, args)

	-- Checks to see if this is a priority task or not
	local jobCode = self:getCodeChunk(job, "priority")
	local q
	
	-- Set the appropriate priority
	if jobCode == 1 then
		q = "tasks"
	elseif jobCode == 2 then
		q = "buffer"
	elseif jobCode == 3 then
		q = "period"
	elseif jobCode == 4 then
		q = "maintenance"
	elseif jobCode == 0 then
		q = "priority"
	end

	-- Put the job in its queue
	table.insert(self.queues[q], {job, unpack(args or {})})
	
	-- Increase Queue size
	self.values.size = self.values.size + 1
	
end

-- Gets an item from the front of the queue
function Queue:pop(queue)

	return self.queues[queue][1]
	
end

-- Gets a chunk from the queue
function Queue:getCodeChunk(job, chunk)
	return math.floor( math.floor(job / self.values.code[chunk][1]) % self.values.code[chunk][2]) 
end
	