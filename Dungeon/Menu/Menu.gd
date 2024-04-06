extends CanvasLayer


func _ready():
	Signals.pause_game.connect(pause_game)


func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pause_game()


func pause_game():
	self.visible = !self.visible
	if self.is_inside_tree():
		get_tree().paused = !get_tree().paused
