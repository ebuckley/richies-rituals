
show_debug_message('game_init')
randomize();
log_init()



//initial state
global.levels_completed = 0

global.activeRoutines = ds_list_create()


global.possibleRoutines = ds_list_create()
ds_list_add(global.possibleRoutines, "Jump an even number of times")
ds_list_add(global.possibleRoutines, "Jump at least 4 times")
ds_list_add(global.possibleRoutines, "Jump exactly 6 times")
ds_list_add(global.possibleRoutines, "You must be walking right")
ds_list_add(global.possibleRoutines, "You must be walking left")
ds_list_add(global.possibleRoutines, "You must sacrifice a life")

//  copy of the possibleRoutines so we can reference them by name in the player_goal_test
global.referenceRoutines = ds_list_create()
ds_list_copy(global.referenceRoutines, global.possibleRoutines)

ds_list_shuffle(global.possibleRoutines)

