log('GAME OVER!')
if  lives == 1 {
    game_restart()
} else {
    lives -= 1
    level_init()
}

