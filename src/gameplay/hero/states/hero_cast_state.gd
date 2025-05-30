class_name HeroCastState
extends State

@export var input: PlayerInput
@export var console: MagicConsole
@export var caster: SpellCaster

func enter() -> void:
	console.enable()

func exit() -> void:
	console.disable()

func process(delta: float) -> void:
	if input.is_casting():
		caster.cast(console.get_spell())
		state_machine.enter(HeroMovementState)
