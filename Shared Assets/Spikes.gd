extends Area2D

func _ready():
	var _err = connect('body_entered', self, '_on_Spikes_body_entered')


func _on_Spikes_body_entered(body):
	if body.name == 'player':
		body.die()
