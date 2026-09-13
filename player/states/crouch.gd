class_name PlayerStateCrouch
extends PlayerState


func enter() -> void:
	print("Entered Crouch")


func physics_process(_delta: float) -> PlayerState:
	# Stop crouching
	if not Input.is_action_pressed("down"):
		if player.direction.x != 0:
			return run
		else:
			return idle
	
	# Dash
	if Input.is_action_just_pressed("dash"):
		return dash
	
	return next_state
