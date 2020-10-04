extends KinematicBody2D

const UP = Vector2(0, -1)
var GRAVITY = 9.8 *1000
var ACCELERATION = 75
var FRICTION = 1
const MAX_SPEED = 700*1.5
const JUMP_HEIGHT = -1500*1.9
const MIN_JUMP_HEIGHT = -500*2


var motion = Vector2()
var grabbing = false
var jumping = false
var sliding = true
var canmove = true
var dir = 1
var on_wall = false
var which_wall = 0
onready var jt = $jump_timer
onready var camerapos = $camerapos


func _physics_process(delta):
	on_wall = $Right.is_colliding() || $Left.is_colliding()
	if $Right.is_colliding():
		which_wall = -1
	if $Left.is_colliding():
		which_wall = 1
	# print(str(on_wall))
	motion.y += GRAVITY*delta
	var friction = false
	movement(friction)
	direction()
	slide(delta)
	if canmove:	
		motion = move_and_slide(motion, UP)
	# print($Left.name + str($Left.is_colliding()))
	# print($Right.name + str($Right.is_colliding()))
	
func slide(delta):
	if on_wall and Input.is_action_pressed("grab"):
		
		# motion.y = 145
		if motion.y >0:
			motion.y += (-GRAVITY+1000)*delta
		# if !jumping:
		# 	motion.y += 70
			
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
	
	elif on_wall:
		jumping = false
		if Input.is_action_just_pressed("jump"):
			jumping = true
			
			var motion_change =  (10 * Vector2(256,-256))#$RayCast2D/Sprite.position)
			print(dir)
			motion_change.x *= which_wall
			motion = motion_change
			print(motion_change)
			
		
		# if friction == true:
		# 	motion.x = lerp(motion.x, 0, FRICTION)
	else:

		motion.x = lerp(motion.x, 0, 0.05)
		
		# Variable jump height
		if Input.is_action_just_released("jump") && motion.y < MIN_JUMP_HEIGHT:
			motion.y = MIN_JUMP_HEIGHT
			pass
func die():
	canmove = false
	var sound = load("res://sounds/sfx/death/Roblox Death Sound - Sound Effect (HD).wav")
	var die = $particles/die
	die.emitting = true
	$AnimatedSprite.rotation = 90
	$audio.stream = sound
	$audio.play()
	$respawn_timer.start()

func _on_respawn_timer_timeout():
	#Respawning
	position = get_parent().get_node('Level/spawn_point').get_global_transform().get_origin()
	canmove = true
	$AnimatedSprite.rotation = 0
