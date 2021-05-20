var/static/world_initialized = FALSE

/atom/var/initialized = FALSE

/atom/New()
	. = ..()
	if(world_initialized)
		Initialize(arglist(args))

/atom/proc/Initialize() //calls on New or initialize by world
	if(initialized)
		CRASH("Somehow, [type]<\ref[src]> called initialization after initialization")
	initialized = TRUE

/world/New()
	. = ..()
	if(!world_initialized)
		for(var/atom/i in world)
			i.Initialize()
		world_initialized = TRUE
