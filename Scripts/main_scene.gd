extends Node2D

@onready var follow_cam = $user/playerfollowcam
@onready var open_cam = $opencam

func _ready():
	follow_cam.make_current()

func get_destination():
	return get_node("goal")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("camera_swap"):
		if follow_cam.is_current():
			open_cam.make_current()
		else:
			follow_cam.make_current()
