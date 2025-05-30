class_name HeroCastState
extends State

@export var input: PlayerInput
@export var console: MagicConsole

func enter() -> void:
	console.enable()

func exit() -> void:
	console.disable()

func process(delta: float) -> void:
	if input.is_casting():
		var spell: String = console.get_spell()
		print("casted: %s" % spell)
		state_machine.enter(HeroMovementState)
