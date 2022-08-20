extends Button
export var level : int
func _on_levelbutton_pressed():
	var levelnumber = $".".level
	var scenepath = "res://level/"+str(levelnumber)+".tscn"
	get_tree().change_scene(scenepath)
