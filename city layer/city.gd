extends Node2D

onready var player = get_node('player')

# Called when the node enters the scene tree for the first time.
func _ready():
	player.motion = Vector2(300,-1000)