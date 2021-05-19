#define ICON_PACKET(file, state) list("icon" = file, "state" = state)
#define PREFAB_FOR_DICTIONARY(type, _name, variables) _name = new type{name = _name; variables}
var/static/list/LifeStates = list(
	PREFAB_FOR_DICTIONARY(/datum/life_state/wall, WALL, icon = ICON_PACKET('icons/life.dmi', "wall"); color = "#000000";),
	PREFAB_FOR_DICTIONARY(/datum/life_state/alive, ALIVE, icon = ICON_PACKET('icons/life.dmi', null); color = "#66ff66";),
	PREFAB_FOR_DICTIONARY(/datum/life_state/dead, DEAD, icon = ICON_PACKET('icons/life.dmi', null); color = "#777777";),
)
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
