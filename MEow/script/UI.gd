extends Control

signal startgame

func _ready():
	pass

func _on_start_pressed():
	get_tree().change_scene("res://level/1.tscn")
	pass 
	
func _on_levelselector_pressed():
	get_tree().change_scene("res://scenes/levelselectorscene.tscn")
	pass
	
func _on_quit_pressed():
	get_tree().quit()	
	pass
