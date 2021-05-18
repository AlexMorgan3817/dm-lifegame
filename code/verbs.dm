//TODO
// /client/verb/export_field()
// 	set_sim(0)

/proc/set_sim(value)
	simulation = value
	world.ProcessLoop()

/client/verb/stop_sim()
	set_sim(0)

/client/verb/continue_sim()
	set_sim(1)

/client/verb/set_sim_delay()
	sim_delay = input("Set simulation delay","Sim Delay",sim_delay) as num

/turf/Click()
	var/obj/lifecell/hosted_cell = locate(/obj/lifecell) in src
	if(!hosted_cell)
		hosted_cell = new(src)
	hosted_cell.Click(arglist(args))

/obj/lifecell/Click(location,control,params)
	var/list/p = params2list(params)
	if(p["middle"])
		StateChange(WALL)
	else if(p["ctrl"])
		StateChange(DEAD)
	else
		StateChange(ALIVE)
	update_icon()