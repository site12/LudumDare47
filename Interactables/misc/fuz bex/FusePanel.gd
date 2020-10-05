extends Node2D

var in_range
var panel = false
var player

func _on_Area2D_body_entered(body):
	$AnimationPlayer.play('highlight fusebox')
	in_range = true
	if body.name == 'player':
		player = body


func _on_Area2D_body_exited(body):
	$AnimationPlayer.play_backwards('highlight fusebox')
	in_range = false

func _input(event):
	if Input.is_action_just_pressed("interact") and in_range:
		panel = !panel
		if panel:
			if player:
				player.canmove = false
			get_parent().get_node("CanvasLayer/fusebox").interacting = true
			get_parent().get_node("CanvasLayer/fusebox/AnimationPlayer").play("fade")
		else:
			if player:
				player.canmove = true
			get_parent().get_node("CanvasLayer/fusebox").interacting = false
			get_parent().get_node("CanvasLayer/fusebox/AnimationPlayer").play_backwards("fade")

func _fusebox_complete():
	player.pass_camera_shake(10)
	
