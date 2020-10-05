extends Node2D

var in_range


func _on_Area2D_body_entered(body):
	$AnimationPlayer.play('highlight fusebox')
	in_range = true


func _on_Area2D_body_exited(body):
	$AnimationPlayer.play_backwards('highlight fusebox')
	in_range = false

func _input(event):
	if Input.is_action_just_pressed("interact") and in_range:
		print('panel')
