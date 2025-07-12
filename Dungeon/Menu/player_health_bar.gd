extends ProgressBar

class_name PlayerHealthBar


var _max_health : float = 100.0
var _current_health: float = 100.0

func _ready():
	Signals.player_health.connect(update_health)


func update_health(current_health : float, max_health: float):
	_current_health = current_health
	_max_health = max_health


func _process(_delta: float) -> void:
	self.value = _current_health
	self.max_value = _max_health
	
