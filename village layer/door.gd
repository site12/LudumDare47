extends Sprite

export var scene = "path"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var in_range = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	in_range = true

func _on_Area2D_body_exited(body):
	in_range = false

func _input(event):
	if Input.is_action_just_pressed("interact") and in_range:
		get_tree().change_scene(scene)