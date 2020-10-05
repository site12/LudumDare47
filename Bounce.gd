extends Area2D

onready var root = get_tree().get_root().get_node('root')

func _on_Bounce_body_entered(body):
	if body.name == 'player':
		var city = load('res://city layer/city.tscn').instance()
		city.position = root.get_node('city point').position
		body.motion.x = 0
		root.add_child(city)
		root.get_node('Bio').call_deferred('queue_free')
		body.motion = Vector2(200, -6000)
		body.change_zone('city')
		
		
