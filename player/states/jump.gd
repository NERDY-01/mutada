class_name PlayerStateJump
extends PlayerState


var jump_force: float = -640.0
var air_speed: float = 400.0


func enter() -> void:
	print("Entered Jump")
	player.velocity.y = jump_force


func physics_process(_delta: float) -> PlayerState:
	# Horizontal air movement
	var direction := Input.get_axis("left", "right")
	player.velocity.x = direction * air_speed
	
	# Start falling
	if player.velocity.y >= 0:
		return fall
	
	# Dash
	if Input.is_action_just_pressed("dash"):
		return dash
	
	return next_state
