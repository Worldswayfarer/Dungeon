extends CanvasLayer


func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		self.visible = !self.visible
		get_tree().paused = !get_tree().paused
