extends CharacterBody2D

signal position_changed(pos)

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			position = get_global_mouse_position()
			position_changed.emit(position)


func _on_control_position_selected(new_loc: Variant) -> void:
	match new_loc:
		"1.34":
			position = Vector2(693, -48)
		"1.35":
			position = Vector2(859, -48)
		"1.36":
			position = Vector2(968, -48)
		"1.37":
			position = Vector2(1095, -48)
		"1.38":
			position = Vector2(832, 208)
	position_changed.emit(position)
