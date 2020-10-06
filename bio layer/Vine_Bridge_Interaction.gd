extends Area2D

onready var anim_player = get_parent().get_node('AnimationPlayer')
var in_range = false
var player

func _on_Vine_Bridge_Interaction_body_entered(body):
	if body.name == 'player':
		in_range = true
		anim_player.play('Outline')
		player = body

func _on_Vine_Bridge_Interaction_body_exited(body):
	if body.name == 'player':
		in_range = true
		anim_player.play_backwards('Outline')
		player = body

func _input(event):
	if in_range and Input.is_action_just_pressed("interact") and player.has_machete:
		# var bio_level = load('res://bio layer/BioLevel.tscn').instance()
		# var root = get_tree().get_root().get_node('root')
		# bio_level.position = root.get_node('bio point').position
		# root.add_child(bio_level)
		get_parent().call_deferred('queue_free')
		
		
