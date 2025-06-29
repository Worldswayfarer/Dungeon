extends Node


signal player_position_updated(player_position)
signal enemy_death(object)
signal player_death()
signal end_of_wave()
signal access_next_room()
signal entered_portal()
signal pause_game()
signal restart_game()


var signals = [
	player_position_updated,
	enemy_death,
	player_death,
	end_of_wave,
	access_next_room,
	entered_portal,
	pause_game,
	restart_game
	]