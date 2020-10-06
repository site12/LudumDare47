extends Node2D

func _on_End_body_entered(body):
	if body.name == 'player':
		# position.x += 20480
		get_parent().move_world(20480)

func _on_Back_body_entered(body):
	if body.name == 'player':
		# position.x -= 20480
		get_parent().move_world(-20480)

func _on_Falling_Zone_body_entered(body):
	if body.name == 'player':
		body.change_zone('bio')
		get_tree().get_root().get_node('root/ice').call_deferred('queue_free')
