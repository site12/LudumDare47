extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func show():
	pass

func _on_Timer_timeout():
	visible_characters += 1

func _on_Area2D_body_entered(body):
	$Timer.start()
	#print("entered")
	get_parent().get_parent().get_node("AnimationPlayer").play("highlight")


func _on_Area2D_body_exited(body):
	#print("left")
	get_parent().get_parent().get_node("AnimationPlayer").play_backwards("highlight")
