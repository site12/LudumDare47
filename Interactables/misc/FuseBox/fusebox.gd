extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var switch1 = $switch1/switch
onready var switch2 = $switch2/switch2
onready var switch3 = $switch3/switch3
onready var switch4 = $switch4/switch4
onready var switch5 = $switch5/switch5
onready var switch6 = $switch6/switch6
var interacting = false
# Called when the node enters the scene tree for the first time.
func _ready():
	switch1.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _input(event):
#	if switch1.pressed  == true:
#		pass
#	if switch2.pressed  == true:
#		switch4.pressed = !switch4.pressed
#		switch6.pressed = !switch6.pressed
#	if switch3.pressed  == true:
#		switch1.pressed = !switch1.pressed
#	if switch4.pressed  == true:
#		pass
#	if switch5.pressed  == true:
#		pass
#	if switch6.pressed  == true:
#		switch1.pressed = !switch1.pressed
	
