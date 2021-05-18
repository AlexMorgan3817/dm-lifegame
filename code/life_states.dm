#define ICON_PACKET(file, state) list("icon" = file, "state" = state)
#define PREFAB_FOR_DICTIONARY(type, _name, variables) _name = new type{name = _name; variables}

var/static/list/LifeStates = list(
	PREFAB_FOR_DICTIONARY(/datum/life_state, WALL, icon = ICON_PACKET('icons/life.dmi', "wall"); color = "#000000";),
	PREFAB_FOR_DICTIONARY(/datum/life_state, ALIVE, icon = ICON_PACKET('icons/life.dmi', null); color = "#66ff66";),
	PREFAB_FOR_DICTIONARY(/datum/life_state, DEAD, icon = ICON_PACKET('icons/life.dmi', null); color = "#777777";),
)

/proc/GetLifeStateByName(_name)
	. = LifeStates[_name]
	// for(var/datum/life_state/state in LifeStates)
	// 	if(state.name == _name)
	// 		return state

/datum/life_state
	var/name = DEAD
	var/icon = ICON_PACKET('icons/life.dmi', null)
	var/color = "#777777"

/datum/life_state/proc/ApplyTo(obj/Target)
#if !USE_ANIMATION
	Target.name = name
	Target.icon = icon["icon"]
	Target.icon_state = icon["state"]
	Target.color = color
#else
	animate(Target, name=src.name, icon = src.icon["icon"], icon_state = src.icon["state"], color = src.color, time = sim_delay)
#endif
