extends Node2D

func move_world(amount):
	for node in get_children():
		if node.name != 'player':
			# node.position.x += amount
			node.set_deferred('position', node.position + Vector2(amount,0)) 
