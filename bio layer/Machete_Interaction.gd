extends Area2D

onready var anim_player = get_parent().get_node('AnimationPlayer')
var in_range = false
var player

func _on_Machete_Interaction_body_entered(body):
	if body.name == 'player':
		in_range = true
		anim_player.play('Outline')
		player = body

func _on_Machete_Interaction_body_exited(body):
	if body.name == 'player':
		in_range = true
		anim_player.play_backwards('Outline')
		player = body

func _input(_event):
	if in_range and Input.is_action_just_pressed("interact"):
		player.got_machete()
		get_parent().visible = false
		###Get Machete

