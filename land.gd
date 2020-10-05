extends Particles2D


func _ready():
	self.emitting = true

func _on_Timer_timeout():
	call_deferred('queue_free')