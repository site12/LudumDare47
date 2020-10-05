extends Sprite

export var scene = "path"
export var from = 'node name'
export var to = 'node name'
export var point = 'pos2d name'
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var in_range = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body.name == 'player':
		in_range = true
		$ColorRect/Label/Timer.start()
		$AnimationPlayer.play("highlight")

func _on_Area2D_body_exited(body):
	if body.name == 'player':
		in_range = false
		$AnimationPlayer.play_backwards("highlight")

func _input(event):
	if Input.is_action_just_pressed("interact") and in_range:
		# get_tree().change_scene(scene)
		var root = get_tree().get_root().get_node('root')
		var new_scene = load(scene).instance()
		root.add_child(new_scene)
		new_scene.position = root.get_node(point).get_global_position()
		
		root.get_node('player').set_deferred('position', root.get_node(to).get_node('DoorHole').global_position)
		root.get_node(from).call_deferred('queue_free')


func _on_Timer_timeout():
	$ColorRect/Label.visible_characters += 1 
