class_name Player
extends CharacterBody2D


#region State Machine Variables

var states: Array[PlayerState]

var current_state: PlayerState:
	get:
		return states.front()

var previous_state: PlayerState:
	get:
		if states.size() > 1:
			return states[1]
		return null

#endregion


#region Standard Variables

var direction: Vector2 = Vector2.ZERO
var gravity: float = 980.0

#endregion


func _ready() -> void:
	initialize_states()


func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))


func _process(delta: float) -> void:
	update_direction()
	change_state(current_state.process(delta))


func _physics_process(delta: float) -> void:
	# Apply gravity
	velocity.y += gravity * delta
	
	# Let the current state control movement
	change_state(current_state.physics_process(delta))
	
	# Move the character
	move_and_slide()


#region State Machine

func initialize_states() -> void:
	states = []
	
	# Gather all states
	for c in $States.get_children():
		if c is PlayerState:
			states.append(c)
			c.player = self
	
	if states.size() == 0:
		return
	
	# Initialize all states
	for state in states:
		state.init()
	
	# First state
	current_state.enter()
	
	# Update state label
	$Label.text = "State: " + current_state.name


func change_state(new_state: PlayerState) -> void:
	if new_state == null:
		return
	
	if new_state == current_state:
		return
	
	# Exit old state
	if current_state:
		current_state.exit()
	
	# Add new state to the front
	states.push_front(new_state)
	
	# Enter new state
	current_state.enter()
	
	# Keep state history to 5 states
	states.resize(5)
	
	# Update label
	$Label.text = "State: " + current_state.name

#endregion


#region Direction

func update_direction() -> void:
	var x_axis := Input.get_axis("left", "right")
	var y_axis := Input.get_axis("jump", "down")
	
	direction = Vector2(x_axis, y_axis)

#endregion
