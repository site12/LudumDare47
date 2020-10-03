extends KinematicBody2D

const UP = Vector2(0, -1)
var GRAVITY = 20
var ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -500
const MIN_JUMP_HEIGHT = -200


var motion = Vector2()
var grabbing = false
var jumping = false
var dir = 1
onready var jt = $jump_timer
onready var camerapos = $camerapos


func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	climb(friction)
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
	

func direction():
	if dir == -1:
		camerapos.position.x = 52
	else:
		camerapos.position.x = -52
	print(camerapos)
		
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
	if is_on_floor() || grabbing:
		if grabbing:
			grabbing = false
		jt.start()
		if Input.is_action_just_pressed("jump"):
			jumping = true
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, .2)
	elif !grabbing:

		motion.x = lerp(motion.x, 0, .05)
		
		# Variable jump height
		if Input.is_action_just_released("jump") && motion.y < MIN_JUMP_HEIGHT:
			motion.y = MIN_JUMP_HEIGHT

func climb(friction):
	if is_on_wall() && Input.get_action_strength("grab")==1 && !jumping:
		grabbing = true
		friction = true
		motion.y = $Position2D.position.y
		motion.x = $Position2D.position.x
	else:
		grabbing = false
		GRAVITY = 20
		friction = false


func _on_jump_timer_timeout():
	jumping = false
