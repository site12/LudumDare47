extends KinematicBody2D

const UP = Vector2(0, -1)
var GRAVITY = 30
var ACCELERATION = 50
var FRICTION = 0.5
const MAX_SPEED = 500
const JUMP_HEIGHT = -700*1.5
const MIN_JUMP_HEIGHT = -400*1.5


var motion = Vector2()
var grabbing = false
var jumping = false
var dir = 1
onready var jt = $jump_timer
onready var camerapos = $camerapos


func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	movement(friction)
	#direction()
	motion = move_and_slide(motion, UP, 5, 4, PI/3)
#	if position.x > 2560:
#		position.x -= 3072
#		$camerapos/Camera2D.reset_smoothing()
#	elif position.x < -1536:
#		position.x += 3072
#		$camerapos/Camera2D.reset_smoothing()
func _process(_delta):
	pass
	

		
func movement(friction):
	#left and right
	if Input.is_action_pressed("right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		dir = -1
		
	elif Input.is_action_pressed("left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		dir = 1
	else:
		friction = true
	
	#jump
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, FRICTION)
	else:

		motion.x = lerp(motion.x, 0, 0.05)
		
		# Variable jump height
		if Input.is_action_just_released("jump") && motion.y < MIN_JUMP_HEIGHT:
			motion.y = MIN_JUMP_HEIGHT

