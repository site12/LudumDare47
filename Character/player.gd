extends KinematicBody2D

const UP = Vector2(0, -1)
var GRAVITY = 9.8 *1000
var ACCELERATION = 75
var FRICTION = 0.5
const MAX_SPEED = 700
const JUMP_HEIGHT = -1500*1.9
const MIN_JUMP_HEIGHT = -500*2


var motion = Vector2()
var grabbing = false
var jumping = false
var sliding = true
var canmove = true
var dir = 1
onready var jt = $jump_timer
onready var camerapos = $camerapos


func _physics_process(delta):
	motion.y += GRAVITY*delta
	var friction = false
	movement(friction)
	direction()
	slide()
	if canmove:	
		motion = move_and_slide(motion, UP)
	
func slide():
	if is_on_wall() and Input.is_action_pressed("grab"):
		
		motion.y = $RayCast2D.position.y
		if !jumping:
			motion.y += 70
		if $RayCast2D.collide_with_bodies:
			pass
		
	else:
		sliding = false
		#GRAVITY = 35
	
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
		jumping = false
		if Input.is_action_just_pressed("jump"):
			motion.y += JUMP_HEIGHT
			jumping = true
		if friction == true:
			motion.x = lerp(motion.x, 0, FRICTION)
	
	elif is_on_wall():
		jumping = false
		if Input.is_action_just_pressed("jump"):
			jumping = true
			
			motion +=  dir*(10 * $RayCast2D.cast_to)
			print(-dir*(7 * $RayCast2D.cast_to.x))
			
		
		if friction == true:
			motion.x = lerp(motion.x, 0, FRICTION)
	else:

		motion.x = lerp(motion.x, 0, 0.05)
		
		# Variable jump height
		if Input.is_action_just_released("jump") && motion.y < MIN_JUMP_HEIGHT:
			motion.y = MIN_JUMP_HEIGHT
			pass
func die():
	var sound = load("res://sounds/sfx/death/Roblox Death Sound - Sound Effect (HD).wav")
	var die = $particles/die
	die.emitting = true
	$AnimatedSprite.rotation = 90
	$audio.stream = sound
	$audio.play()
