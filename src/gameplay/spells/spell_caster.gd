class_name SpellCaster
extends Node

signal error(reason: String)

@export var caster: Node3D
@export var spell_point: Node3D
@export var target_spell: PackedScene

var elements: Array[String] = [
	"fire", "water", "ice", "earth"
]

var forms: Array[String] = [
	"ball", "blast", "skin", "shield", "heal"
]

func cast(spell_name: String) -> void:
	print("cast: %s" % parse_spell(spell_name))
	
	var parsed_spell: Spell = parse_spell(spell_name)
	var spell: TargetSpell = target_spell.instantiate()
	caster.get_parent().add_child(spell)
	spell.global_position = spell_point.global_position
	
	if parsed_spell.element == "fire":
		spell.initialize(Color.RED)
	else:
		spell.initialize(Color.AQUA)

func parse_spell(spell_name: String) -> Spell:
	var spell := Spell.new()
	spell.full_name = spell_name
	
	for element in elements:
		if spell_name.begins_with(element):
			spell.element = element
			break
	
	for form in forms:
		if spell_name.ends_with(form):
			spell.form = form
			break
	
	return spell
