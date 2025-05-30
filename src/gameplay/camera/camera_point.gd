class_name CameraPoint
extends Node3D

@export var follow_target: Node3D

@onready var camera: Camera3D = %Camera3D

func _physics_process(_delta: float) -> void:
	if follow_target == null:
		return
	
	global_position = follow_target.global_position
