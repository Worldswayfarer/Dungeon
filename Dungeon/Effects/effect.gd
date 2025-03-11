class_name Effect

func _init():
	push_error("Class must implement _init()")


func clone():
	push_error("Class must implement clone()")


func scale(_caster):
	push_error("Class must implement scale()")


func apply_effect(_target):
	push_error("Class must implement apply_effect()")
