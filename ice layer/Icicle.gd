extends RigidBody2D


func _on_Icicle_body_entered(body):
	print(body.name)
	if body.name == 'player':
		body.die()
	else:
		#spawn particles
		queue_free()
