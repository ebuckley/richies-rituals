global.jump_count = 0
global.has_moved_left = false

var spawnX
var spawnY
with (obj_player_spawn) {
    spawnX = x
    spawnY = y
}
global.player = instance_create(spawnX, spawnY, obj_player)

with (obj_goal_spawn) {
    global.goal = instance_create(x,y, obj_goal)
}


view_object[0] = global.player
