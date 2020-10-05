extends Node2D

var in_range
var panel = false

func _on_Area2D_body_entered(body):
	$AnimationPlayer.play('highlight fusebox')
	in_range = true


func _on_Area2D_body_exited(body):
	$AnimationPlayer.play_backwards('highlight fusebox')
	in_range = false

func _input(event):
	if Input.is_action_just_pressed("interact") and in_range:
		panel = !panel
		if panel:
			get_parent().get_node("CanvasLayer/fusebox").interacting = true
			get_parent().get_node("CanvasLayer/fusebox/AnimationPlayer").play("fade")
		else:
			get_parent().get_node("CanvasLayer/fusebox").interacting = false
			get_parent().get_node("CanvasLayer/fusebox/AnimationPlayer").play_backwards("fade")
