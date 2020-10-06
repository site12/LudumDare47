extends Area2D

onready var root = get_tree().get_root().get_node('root')
var activated = false

func _on_Bounce_body_entered(body):
	if body.name == 'player':
		if not activated:
			var city = load('res://city layer/city.tscn').instance()
			city.set_deferred('position',root.get_node('city point').position)
			body.motion.x = 0
			root.call_deferred('add_child', city)
			root.get_node('Bio').call_deferred('queue_free')

		body.motion = Vector2(200, -6000)
		body.change_zone('city')
		
		
