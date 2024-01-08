extends Node2D


func _ready():
	Signals.end_of_wave.connect(cleanup)


func cleanup():
	for child in get_children():
		remove_child(child)
		child.queue_free()
