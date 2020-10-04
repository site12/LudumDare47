extends Area2D

func _ready():
	connect('body_entered', self, '_on_Ice_body_entered')
	connect('body_exited', self, '_on_Ice_body_exited')

func _on_Ice_body_entered(body):
	if body.name == 'player':
		body.on_ice = true

func _on_Ice_body_exited(body):
	if body.name == 'player':
		body.on_ice = false