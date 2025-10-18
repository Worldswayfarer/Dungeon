extends Label

@export var _time_passed : RoundTime

func _process(_delta : float) -> void:
	text = str(_time_passed.current_round_time) + "Seconds"
