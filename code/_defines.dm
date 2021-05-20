#define DEAD "dead"
#define ALIVE "alive"
#define WALL "wall"

#define ADD_NEW_STATE_PREFAB(type, _name, variables) /world/New() {global.LifeStates[_name] = new type{name = _name; variables}; . = ..()}
#define ICON_PACKET(file, state) list("icon" = file, "state" = state)
#define PREFAB_FOR_DICTIONARY(type, _name, variables) _name = new type{name = _name; variables}
