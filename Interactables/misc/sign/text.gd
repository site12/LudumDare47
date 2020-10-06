extends Label

func _on_Timer_timeout():
	visible_characters += 1

func _on_Area2D_body_entered(body):
	if body.name == 'player':
		$Timer.start()
		get_parent().get_parent().get_node("AnimationPlayer").play("highlight")


func _on_Area2D_body_exited(body):
	if body.name == 'player':
		get_parent().get_parent().get_node("AnimationPlayer").play_backwards("highlight")
