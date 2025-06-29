extends Button

class_name RestartButton


func _on_pressed() -> void:
	Signals.restart_game.emit()
