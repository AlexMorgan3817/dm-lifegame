var/simulation = FALSE
var/sim_delay = 10
/world/New()
	. = ..()
	ProcessLoop()

/world/proc/ProcessLoop()
	set waitfor = 0
	while(1)
		sleep(sim_delay)
		if(!simulation)
			break
		// for(var/obj/O in world)
		// 	O.process()
		LifeCellProcessing()

/world/proc/LifeCellProcessing()
	for(var/obj/lifecell/cell in cells) //Two loops cause apply of next state should be after it's calculation, not at same time. 
		cell.process()
	for(var/obj/lifecell/cell in cells)
		cell.ApplyNextState()

/obj/proc/process()
