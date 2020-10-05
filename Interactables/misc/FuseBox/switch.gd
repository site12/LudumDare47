extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var fusebox = get_parent().get_parent()

onready var switch1 = fusebox.get_node('switch1/switch')
onready var switch2 = fusebox.get_node('switch2/switch2')
onready var switch3 = fusebox.get_node('switch3/switch3')
onready var switch4 = fusebox.get_node('switch4/switch4')
onready var switch5 = fusebox.get_node('switch5/switch5')
onready var switch6 = fusebox.get_node('switch6/switch6')
onready var interacting = get_parent().get_parent().interacting
onready var animation_player = get_tree().get_root().get_node('root/cavechunk/AnimationPlayer')


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_switch1_toggled(button_pressed):
	$green.visible = button_pressed

func _on_switch_pressed():
	test_switches()

func _on_switch2_toggled(button_pressed):
	$green.visible = button_pressed

func _on_switch2_pressed():
	switch4.pressed = !switch4.pressed
	switch6.pressed = !switch6.pressed
	test_switches()

func _on_switch3_toggled(button_pressed):
	$green.visible = button_pressed

func _on_switch3_pressed():
	switch1.pressed = !switch1.pressed
	test_switches()

func _on_switch4_toggled(button_pressed):
	$green.visible = button_pressed

func _on_switch4_pressed():
	test_switches()


func _on_switch5_toggled(button_pressed):
	$green.visible = button_pressed

func _on_switch5_pressed():
	test_switches()

func _on_switch6_toggled(button_pressed):
	$green.visible = button_pressed

func _on_switch6_pressed():
	switch1.pressed = !switch1.pressed
	test_switches()


func _on_switch_focus_entered():
	switch1.get_parent().get_node("highlight").visible = true
func _on_switch_focus_exited():
	switch1.get_parent().get_node("highlight").visible = false

func _on_switch2_focus_entered():
	switch2.get_parent().get_node("highlight").visible = true
func _on_switch2_focus_exited():
	switch2.get_parent().get_node("highlight").visible = false

func _on_switch3_focus_entered():
	switch3.get_parent().get_node("highlight").visible = true
func _on_switch3_focus_exited():
	switch3.get_parent().get_node("highlight").visible = false

func _on_switch4_focus_entered():
	switch4.get_parent().get_node("highlight").visible = true
func _on_switch4_focus_exited():
	switch4.get_parent().get_node("highlight").visible = false


func _on_switch5_focus_entered():
	switch5.get_parent().get_node("highlight").visible = true
func _on_switch5_focus_exited():
	switch5.get_parent().get_node("highlight").visible = false


func _on_switch6_focus_entered():
	switch6.get_parent().get_node("highlight").visible = true
func _on_switch6_focus_exited():
	switch6.get_parent().get_node("highlight").visible = false

func test_switches():
	if switch1.pressed and switch2.pressed and switch3.pressed and switch4.pressed and switch5.pressed and switch6.pressed:
		animation_player.play('glowey')
		get_parent().get_parent().get_node('AnimationPlayer').play_backwards('fade')
		fusebox.call_deferred('queue_free')
		var ice = load('res://ice layer/ice_level.tscn').instance()
		ice.position = get_tree().get_root().get_node('root/ice point').position
		get_tree().get_root().get_node('root').add_child(ice)















