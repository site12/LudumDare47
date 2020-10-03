extends RigidBody2D


func _on_Area2D_body_entered(body):
	print('entered')
	set_deferred('mode', MODE_RIGID)
	# apply_central_impulse(Vector2(0,-1))

func _physics_process(delta):
	pass
