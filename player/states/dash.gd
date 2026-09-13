class_name PlayerStateDash
extends PlayerState


var dash_speed: float = 1000.0
var dash_duration: float = 0.2
var dash_timer: float = 0.0
var dash_direction: float = 1.0


func enter() -> void:
	print("Entered Dash")
	
	dash_timer = dash_duration
	
	# Dash in the direction the player is facing/moving
	if player.direction.x != 0:
		dash_direction = player.direction.x


func physics_process(delta: float) -> PlayerState:
	# Move during dash
	player.velocity.x = dash_direction * dash_speed
	
	dash_timer -= delta
	
	# Dash finished
	if dash_timer <= 0:
		if player.direction.x != 0:
			return run
		else:
			return idle
	
	return next_state
