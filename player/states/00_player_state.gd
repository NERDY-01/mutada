@icon("res://player/states/state.svg")
class_name PlayerState extends Node

var player: Player
var next_state: PlayerState

#region /// state references
#reference to all other states
@onready var run: PlayerStateRun = %Run
@onready var idle: PlayerStateIdle = %Idle

#endregion

#what happens when this state is initialized
func init() -> void:
	#print("init:",name)
	pass


#what happen when we enter this state?
func enter() -> void:
	#print("enter:",name)
	pass


#what happen when we exit this state?
func exit() -> void:
	#print("exit:",name)
	pass


#what happen when input is pressed which state based on input
func handle_input(_event : InputEvent) -> PlayerState:
	#print("handle input:",name)
	return next_state

#what happens each process tick in this state?
func process(_delta: float) -> PlayerState:
	#print("p:",name, _delta)
	return next_state

#what happen each physics_process tick in this state?
func physics_process(_delta: float) -> PlayerState:
	return next_state
