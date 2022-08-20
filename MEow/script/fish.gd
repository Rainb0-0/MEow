extends Area2D
signal fish_eaten
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_fish_body_entered(body):
	queue_free()
	emit_signal("fish_eaten")
	pass # Replace with function body.
