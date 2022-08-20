extends CanvasLayer

var youwonscene = preload("res://scenes/youwon.tscn")
func _on_titlemenubutton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/UI.tscn")
	pass


func _on_nextlevelbutton_pressed():
	var currentlevelnum = int(get_tree().current_scene.get_name())
	var nextlevelpath = "res://level/"+str(currentlevelnum+1)+".tscn"
	if ResourceLoader.exists(nextlevelpath):
		get_tree().change_scene(nextlevelpath)
	else:
		get_tree().change_scene("res://scenes/youwon.tscn")
	get_tree().paused = false
	pass
