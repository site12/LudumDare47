extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

func show():
	$Timer.start()

func _on_Timer_timeout():
	get_parent().visible_characters += 1
