var/const/ACTION_RATE = 30
var/const/NO_ACTION = 0

client
    North()
        mob.action = NORTH
    South()
        mob.action = SOUTH
    East()
        mob.action = EAST
    West()
        mob.action = WEST
    Northeast()
        return
    Northwest()
        return
    Southeast()
        return
    Southwest()
        return