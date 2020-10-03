extends Node2D


var before = load("res://template/chunk3.tscn")
var after = load("res://template/chunk2.tscn")

onready var beforepos = $beforepos
onready var afterpos = $afterpos

func _ready():
	get_parent().generate_chunk(before, beforepos.position)
	print("generated")
	get_parent().generate_chunk(after, afterpos.position)
	print("generated")
