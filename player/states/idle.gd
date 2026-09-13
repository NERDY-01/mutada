class_name PlayerStateIdle
extends PlayerState


func enter() -> void:
	print("Entered Idle")
	player.velocity.x = 0


func physics_process(_delta: float) -> PlayerState:
	# Fell off platform
	if not player.is_on_floor():
		return fall
	
	# Start running
	if player.direction.x != 0:
		return run
	
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
