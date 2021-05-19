/world
	fps = 40
	icon_size = 32

	view = "95x50"

	maxx = 100
	maxy = 100
	maxz = 1

	turf = /turf/simulator
/atom/movable/step_size = 32
/mob/New()
	. = ..()
	x = world.maxx / 2
	y = world.maxy / 2

/mob/Login()
	. = ..()
	src << "To move and observe field that is out of bounds, use arrows.\n\
	To start/stop simulation, use verb 'Continue' and 'Stop' in 'SIMULATION' tab.\n\
	To change speed of simulation use verb 'Set Delay' in 'SIMULATION' tab.\n\
	To reset field, use 'Reset' verb in 'Simulation' tab."


