extends Node


var current_chunk = 'res://template/chunk3.tscn'
var previous_chunk = null
var dead_chunk = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_current_chunk(chunk):
	current_chunk = chunk

func set_previous_chunk(chunk):
	previous_chunk = chunk
