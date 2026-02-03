extends CharacterBody2D

signal position_changed(pos)

func _input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			position = get_global_mouse_position()
			position_changed.emit(position)
