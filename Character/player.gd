extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = -100
export (int) var jump_speed_max = -400
export (int) var gravity = 1000
export (float, 0, 1.0) var friction = 0.25
export (float, 0, 1.0) var acceleration = 0.5

var velocity = Vector2.ZERO
var jumping = false
onready var jt = $jump_timer

func get_input():
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
	
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	jump()
	velocity = move_and_slide(velocity, Vector2.UP)
	


func jump():
	if jumping:
		velocity.y = lerp(jump_speed,jump_speed_max,(jt.wait_time-jt.time_left)*10)
		
	if Input.is_action_pressed("jump") && is_on_floor():
		jt.start()
		jumping = true
	elif Input.is_action_just_released("jump"):
		jumping = false	
	
		

func _on_jump_timer_timeout():
	jumping = false
