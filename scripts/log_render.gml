for (var i = 0; i < ds_list_size(global.console_log); i++) {
    draw_text_colour(0, 20 + (i * 20), ds_list_find_value(global.console_log, i), c_black, c_black, c_black, c_black, 1);
}
