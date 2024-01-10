extends Area2D

func _on_body_entered(_body):
	call_deferred("deferred_signal")


func deferred_signal():
	Signals.access_next_room.emit()
