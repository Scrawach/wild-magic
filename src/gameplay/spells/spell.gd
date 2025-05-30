class_name Spell
extends RefCounted

var full_name: String
var element: String
var form: String

func _to_string() -> String:
	return "%s - %s" % [element, form]
