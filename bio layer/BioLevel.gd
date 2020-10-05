extends Node2D

func _on_End_body_entered(body):
	if body.name == 'player':
		position.x += 20480

func _on_Back_body_entered(body):
	if body.name == 'player':
		position.x -= 20480