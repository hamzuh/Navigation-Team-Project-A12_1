extends Camera2D

var min_zoom = Vector2(0.5, 0.5)
var max_zoom = Vector2(2, 2)
var zoom_sens = 0.01

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventPanGesture:
		var new_zoom = zoom.y + (event.delta.y * zoom_sens)
		zoom = Vector2(new_zoom, new_zoom)
		zoom = zoom.clamp(min_zoom, max_zoom)
