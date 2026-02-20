extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var movement_target_position: Vector2 = get_parent().get_destination().position
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

var movement_speed: float = 200.0

func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	navigation_agent.debug_enabled = true

	# Make sure to not await during _ready.
	actor_setup.call_deferred()

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(movement_target_position)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target
	if not navigation_agent.is_target_reachable():
		navigation_agent.debug_enabled = false
		print("Path not reachable")
		return
	navigation_agent.debug_enabled = true
	print(navigation_agent.distance_to_target())
	# Use this with scale to print out distance in metres?
	# get_path_length() / is_target_reachable() might be useful

func _physics_process(delta):
	if not navigation_agent.is_target_reachable():
		navigation_agent.debug_enabled = false
		return
		
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	sprite.rotation = velocity.angle() + PI/2
	move_and_slide()

func _on_goal_position_changed(goalPos) -> void:
	set_movement_target(goalPos)
