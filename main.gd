extends Node2D



func _on_End_body_entered(body):
	$Level.position.x += 12288

func _on_Back_body_entered(body):
	$Level.position.x -= 12288
