ADD_NEW_STATE_PREFAB(/datum/life_state/wall, WALL, icon = ICON_PACKET('icons/life.dmi', "wall"); color = "#000000";)
ADD_NEW_STATE_PREFAB(/datum/life_state/alive, ALIVE, icon = ICON_PACKET('icons/life.dmi', null); color = "#66ff66";)
ADD_NEW_STATE_PREFAB(/datum/life_state/dead, DEAD, icon = ICON_PACKET('icons/life.dmi', null); color = "#777777";)

/datum/life_state/dead/
	name = DEAD
	onCellProcess(obj/lifecell/cell)
		. = ..()
		if(. == 3)
			. = GetLifeStateByName(ALIVE)
/datum/life_state/alive/
	name = ALIVE
	onCellProcess(obj/lifecell/cell)
		. = ..()
		if(. < 2 || . > 3)
			. = GetLifeStateByName(DEAD)
/datum/life_state/wall/
	name = WALL
	onCellProcess(obj/lifecell/cell)
		return WALL
