

var guiX = view_xview[0] + 10
var guiY = view_yview[0] + 10


var levelCountString = 'Level ' + string(global.levels_completed)

draw_text_color(guiX, guiY, levelCountString, c_white, c_white, c_white, c_white, 1)

var msg = ""
var win_test = player_goal_test()
var activeRoutines = win_test[? 'activeRoutines']
for (i = 0; i < ds_list_size(activeRoutines); i++) {
    var this = activeRoutines[| i]
    var name = this[? 'name']
    msg = msg + "#" + string(name)
    if  this[? 'value'] {
        msg += ': pass'
    } else {
        msg += ': fail'
    }
}

draw_text_color(guiX, guiY + 20, msg, c_white, c_white, c_white, c_white, 1)


//debug state
/*
draw_text_colour(guiX, guiY + 160, 'jumps ' + string(global.jump_count), c_aqua, c_aqua, c_aqua, c_aqua, 1)
draw_text_color(guiX, guiY + 120, 'has_moved_left ' + string(global.has_moved_left), c_aqua, c_aqua, c_aqua, c_aqua, 1)
draw_text_color(guiX, guiY + 140, 'has_moved_right ' + string(global.has_moved_right), c_aqua, c_aqua, c_aqua, c_aqua, 1)
*/

// draw the lives
var livesX = view_xview[0] + view_wview[0] - 10
var livesY = view_yview[0] + 45

var spacer = 3

for (i = 0; i < lives; i++) {
    livesX = livesX - spacer - sprite_get_width(spr_life)
    draw_sprite(spr_life, 0, livesX, livesY)
} 

