class_name TargetSpell
extends Node3D

@onready var mesh: MeshInstance3D = $MeshInstance3D

func initialize(color: Color) -> void:
	var material = mesh.get_active_material(0)
	material.albedo_color = color
