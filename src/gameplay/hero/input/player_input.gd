class_name PlayerInput
extends Node

func get_movement_direction(relative: Node3D) -> Vector3:
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.z = Input.get_axis("move_forward", "move_backward")
	input = input.rotated(Vector3.UP, relative.global_rotation.y )
	return input.normalized()

func is_casting() -> bool:
	return Input.is_action_just_pressed("cast")
