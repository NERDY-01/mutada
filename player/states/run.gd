class_name PlayerStateRun
extends PlayerState


var speed: float = 400.0


func enter() -> void:
	print("Entered Run")


func physics_process(_delta: float) -> PlayerState:
	# Fell off platform
	if not player.is_on_floor():
		return fall
	
	# Horizontal movement
	var direction := Input.get_axis("left", "right")
	player.velocity.x = direction * speed
	
	# Stop running
	if direction == 0:
		player.velocity.x = 0
		return idle
	
	# Jump
	if Input.is_action_just_pressed("jump"):
		return jump
	
	# Crouch
	if Input.is_action_pressed("down"):
		return crouch
	
	# Dash
	if Input.is_action_just_pressed("dash"):
		return dash
	
	return next_state
