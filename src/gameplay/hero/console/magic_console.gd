class_name MagicConsole
extends Node3D

@onready var console_edit: LineEdit = %"Console Edit"
@onready var subviewport: SubViewport = %SubViewport

func _ready() -> void:
	console_edit.text_changed.connect(_on_text_changed)

func _on_text_changed(text: String) -> void:
	var caret_column = console_edit.caret_column
	console_edit.text = text.to_upper()
	console_edit.caret_column = caret_column

func enable() -> void:
	show()
	console_edit.grab_focus()

func disable() -> void:
	console_edit.release_focus()
	console_edit.clear()
	hide()

func get_spell() -> String:
	return console_edit.text.to_lower()

func _unhandled_input(event: InputEvent) -> void:
	if not visible:
		return

	subviewport.push_input(event)
