
/obj/lifecell/wall/state = -1
/obj/lifecell
	var/datum/life_state/state = new
	icon = 'icons/life.dmi'

/obj/lifecell/New()
	. = ..()
	if(state != WALL)
		StateChange(pick(DEAD, ALIVE))
	update_icon()

/obj/lifecell/proc/StateChange(newState)
	if(state == newState)
		return FALSE
	if(istext(newState))
		state = GetLifeStateByName(newState)
	else if(istype(newState, /datum/life_state))
		state = newState
	update_icon()

/obj/lifecell/proc/IsState(value)
	return state.name == value

/obj/lifecell/process()
	if(!IsState(WALL))
		var/count = 0
		for(var/obj/lifecell/c in orange(1, src))
			if(c.IsState(ALIVE))
				count += 1
		if(IsState(DEAD) && count == 3)
			StateChange(ALIVE)
		else if(count < 2 || count > 3)
			StateChange(DEAD)

/obj/lifecell/proc/update_icon()
	state.ApplyTo(src)

