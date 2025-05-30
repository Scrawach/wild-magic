class_name StateMachine
extends Node

@export var initial_state: State

var states: Dictionary[Script, State]
var current_state: State

func _ready() -> void:
	initalize_from_children()

func initalize_from_children() -> void:
	for child in get_children():
		if child is State:
			var state: State = child as State
			state.state_machine = self
			states[state.get_script()] = state
	current_state = initial_state
	initial_state.enter()

func enter(target_state: Script) -> void:
	current_state.exit()
	var next_state: State = states[target_state]
	current_state = next_state
	current_state.enter()
