//TODO
// /client/verb/export_field()
// 	set_sim(0)

/proc/set_sim(value)
	simulation = value
	world.ProcessLoop()

/client/verb/stop_sim()
	set name = "Pause"
	set category = "SIMULATION"
	set_sim(0)

/client/verb/continue_sim()
	set name = "Continue"
	set category = "SIMULATION"
	set_sim(1)

/client/verb/set_sim_delay()
	set name = "Set Delay"
	set category = "SIMULATION"

	sim_delay = input("Set simulation delay","Sim Delay",sim_delay) as num

/client/verb/restart_simulation()
	set name = "Reset"
	set category = "SIMULATION"

	RestartSimulation()


/client/verb/ChangeView()
	set name = "Change radius of view"
	set category = "~CLIENT"

	var/new_radius = round(text2num(input("Input radius of view.")))
	
	view = min(new_radius, world.maxx, world.maxy)

/proc/RestartSimulation()
	set_sim(0)
	for(var/obj/lifecell/cell in cells)
		cell.ReInitializeCell()

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