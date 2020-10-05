extends Area2D


	
		


func _on_Area2D_body_entered(body):
	if body.name == 'player':
		body.canmove = false
		body.dir = -1
		body.motion.x = 0
		body.motion = Vector2(200, -5000)
