class_name PlayerStateFall
extends PlayerState


var air_speed: float = 400.0


func enter() -> void:
	print("Entered Fall")


func physics_process(_delta: float) -> PlayerState:
	# Horizontal air movement
	var direction := Input.get_axis("left", "right")
	player.velocity.x = direction * air_speed
	
	# Dash while falling
	if Input.is_action_just_pressed("dash"):
		return dash
	
	# Crouch input
	if Input.is_action_pressed("down"):
		return crouch
	
	# Landed
	if player.is_on_floor():
		if direction != 0:
			return run
		else:
			return idle
	
	return next_state
