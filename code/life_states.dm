var/global/list/LifeStates = list()

/proc/GetLifeStateByName(_name)
	. = LifeStates[_name]

/datum/life_state
	var/name
	var/icon = ICON_PACKET('icons/life.dmi', null)
	var/color = "#777777"

/datum/life_state/proc/ApplyTo(obj/Target)
	Target.name = name
	Target.icon = icon["icon"]
	Target.icon_state = icon["state"]
	Target.color = color

/datum/life_state/proc/onCellProcess(obj/lifecell/cell) // Returns num of alive cells around if shouldn't change state
	. = 0
	for(var/obj/lifecell/c in orange(1, cell))
		if(c.IsState(ALIVE))
			.++
