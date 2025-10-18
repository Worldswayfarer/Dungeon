extends Node

# Player
signal player_position_updated(player_position)
signal player_death()
signal player_health(current_health : float, max_health : float)

# StateData
signal round_time(time : float)



signal enemy_death(object)


# Gameflow
signal end_of_wave()
signal access_next_room()
signal entered_portal()
signal pause_game()
signal restart_game()


var signals = [
	player_position_updated,
	player_health,
	enemy_death,
	player_death,
	end_of_wave,
	access_next_room,
	entered_portal,
	pause_game,
	restart_game,
	round_time,
	]