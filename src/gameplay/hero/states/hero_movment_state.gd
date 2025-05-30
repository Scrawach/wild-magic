class_name HeroMovementState
extends State

const GRAVITY: float = 9.81

@export var hero: Hero
@export var input: PlayerInput

func process(delta: float) -> void:
	var movement_input = input.get_movement_direction(hero.camera_point.camera)
	var movement = movement_input * hero.movement_speed
	movement.y -= GRAVITY
	hero.velocity = movement
	hero.move_and_slide()
	
	if input.is_casting():
		state_machine.enter(HeroCastState)
