extends Node2D


func _on_EXIT_body_entered(body):
	if body.name == 'player':
		var _err = get_tree().change_scene('res://outside world/outside.tscn')