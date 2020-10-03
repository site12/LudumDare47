extends Area2D

export var after_chunk: String
export var before_chunk: String
export var this_chunk: String

onready var before = load(before_chunk)
onready var after = load(after_chunk)
var far_tile
onready var b = before.instance()
onready var a = after.instance()

func _on_Area2D_body_entered(body):
	#b.position.x = get_parent().get_node("beforepos").position.x
	if Global.current_chunk == after_chunk:
		b.position.x = get_parent().position.x - 1024
		get_parent().get_parent().call_deferred("add_child",(b))
		print(b.position.x)
		
	
	#a.position.x = get_parent().get_node("afterpos").position.x
	if Global.current_chunk == before_chunk:
		a.position.x = get_parent().position.x + 1024
		get_parent().get_parent().call_deferred("add_child",(a))
		print(a.position.x)
	
	b.get_node('Area2D').far_tile = a
	a.get_node('Area2D').far_tile = b
	
	
	print("generated")


func _on_Area2D_body_exited(body):
	far_tile.queue_free()
	get_parent().queue_free()
	
