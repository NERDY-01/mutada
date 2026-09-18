class_name PlayerStateDash
extends PlayerState


var dash_speed: float = 1200.0
var dash_duration: float = 0.2
var dash_timer: float = 0.0
var dash_direction: float = 1.0



func enter() -> void:
	print("Entered Dash")
	
	dash_timer = dash_duration
	
	# Dash in the direction the player is facing/moving
	if player.direction.x != 0:
		dash_direction = player.direction.x
	else:
		dash_direction=player.Last_facing_direction.x
	if player.can_dash:
		player.animation_player.play("dash")


func physics_process(delta: float) -> PlayerState:
	# Move during dash
	if player.can_dash:
		player.velocity.x = dash_direction * dash_speed
		#for handling continous dashes in air
		player.can_dash=false
	
	dash_timer -= delta
	
	# Dash finished
	if dash_timer <= 0:
		if player.direction.x != 0:
			return run
		else:
			return idle
	
	return next_state
