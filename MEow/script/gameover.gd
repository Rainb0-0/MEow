extends CanvasLayer



func _on_titlemenubutton_pressed():
	get_tree().change_scene("res://scenes/UI.tscn")
	pass


func _on_replaybutton_pressed():
	var currentlevelnum = int(get_tree().current_scene.get_name())
	var currentlevelpath = "res://level/"+str(currentlevelnum)+".tscn"
	get_tree().change_scene(currentlevelpath)
	get_tree().paused = false
	pass
