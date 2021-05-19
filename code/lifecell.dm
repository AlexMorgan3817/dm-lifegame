var/global/list/cells = list()


/obj/lifecell/wall/state = -1
/obj/lifecell
	var/datum/life_state/state = null
	icon = 'icons/life.dmi'
	var/datum/life_state/nextstate = null


/obj/lifecell/proc/ReInitializeCell()
	nextstate = null
	if(state != WALL)
		StateChange(pick(DEAD, ALIVE))
	update_icon()

/obj/lifecell/New()
	. = ..()
	cells.Add(src)
	ReInitializeCell()

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
	. = ..()
	var/datum/life_state/_process_result = state?.onCellProcess(src)
	if(istype(_process_result))
		nextstate = _process_result

/obj/lifecell/proc/ApplyNextState()
	if(istype(nextstate))
		. = StateChange(nextstate)
		nextstate = null

/*Moved to processing by state
	if(!IsState(WALL))
		var/count = 0
		for(var/obj/lifecell/c in orange(1, src))
			if(c.IsState(ALIVE))
				count += 1
		if(IsState(DEAD) && count == 3)
			StateChange(ALIVE)
		else if(count < 2 || count > 3)
			StateChange(DEAD)
*/
/obj/lifecell/proc/update_icon()
	state.ApplyTo(src)
