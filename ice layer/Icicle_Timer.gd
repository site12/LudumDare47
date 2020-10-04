extends Timer

var icicle = preload('res://ice layer/Icicle.tscn')

func _on_Timer_timeout():
	icicle = icicle.instance()
	icicle.position = Position2D