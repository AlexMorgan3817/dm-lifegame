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
		for(var/obj/O in world)
			O.process()

/obj/proc/process()
