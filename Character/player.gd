extends KinematicBody2D

const UP = Vector2(0, -1)
var GRAVITY = 35
var ACCELERATION = 50
var FRICTION = 0.5
const MAX_SPEED = 600
const JUMP_HEIGHT = -700*1.8
const MIN_JUMP_HEIGHT = -400*1.8


var motion = Vector2()
var grabbing = false
var jumping = false
var sliding = true
var canmove = true
var dir = 1
onready var jt = $jump_timer
onready var camerapos = $camerapos


func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	movement(friction)
	direction()
	slide()
	if canmove:	
		motion = move_and_slide(motion, UP)
	
func slide():
	if is_on_wall() and not is_on_floor():
		sliding = true
		motion.y = $RayCast2D.position.y
		motion.y += 500
		if $RayCast2D.collide_with_bodies:
			pass
		
	else:
		sliding = false
		GRAVITY = 35
	
func direction():
	if dir == 1:
		$RayCast2D.scale.x = -1
		$AnimatedSprite.flip_h = true
	if dir == -1:
		$RayCast2D.scale.x = 1
		$AnimatedSprite.flip_h = false
		
func movement(friction):
	if canmove:
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
	
	elif is_on_wall():
		if Input.is_action_just_pressed("jump"):

			motion.y = JUMP_HEIGHT
			motion.x =  dir*(7 * $RayCast2D.cast_to.x)
			print(-dir*(7 * $RayCast2D.cast_to.x))
			
		
		if friction == true:
			motion.x = lerp(motion.x, 0, FRICTION)
	else:

		motion.x = lerp(motion.x, 0, 0.05)
		
		# Variable jump height
		if Input.is_action_just_released("jump") && motion.y < MIN_JUMP_HEIGHT:
			motion.y = MIN_JUMP_HEIGHT

func die():
	var sound = load("res://sounds/sfx/death/Roblox Death Sound - Sound Effect (HD).wav")
	var die = $particles/die
	die.emitting = true
	$AnimatedSprite.rotation = 90
	$audio.stream = sound
	$audio.play()
