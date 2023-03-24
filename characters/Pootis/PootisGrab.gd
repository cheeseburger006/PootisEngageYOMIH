extends "res://characters/states/Grab.gd"

signal throwbox_position_changed()

func _frame_9():
	throw_techable = true

func _frame_13():
	throw_techable = false

func _frame_5():
	var throwbox = get_child(0)
	
	throwbox.x = 18
	throwbox.y = -111
	throwbox.width = 20
	throwbox.height = 20
	
	emit_signal("throwbox_position_changed")
