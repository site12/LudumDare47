extends Node2D



func _on_End_body_entered(body):
	if body.name == 'player':
		# position.x += 16384
		get_parent().move_world(16384)

func _on_Back_body_entered(body):
	if body.name == 'player':
		# position.x -= 16384
		get_parent().move_world(-16384)


func _on_Falling_Zone_body_entered(body):
	if body.name == 'player':
		get_tree().get_root().get_node('root/cavechunk').call_deferred('queue_free')
		body.canmove = true
		body.change_zone('ice')
