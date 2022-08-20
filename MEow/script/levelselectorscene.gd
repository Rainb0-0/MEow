extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	#store the returned files 
	var filelistarray = get_files("res://level")
	var levellistarray : Array
	#getting the level numbers out of the given array
	for i in filelistarray:
		i = str(i)
		i = i.replace(".tscn", "")
		levellistarray.append(int(i))
	levellistarray.sort()
	#looping through numbers to add new buttons 
	for t in levellistarray:
		var nodenumber = int(t)
		var newbutton = $levelselectorscroll/levelselectorgrid/levelbutton.duplicate()
		#setting the text of the button to the number
		newbutton.text = str(nodenumber)
		#the base button by default is hidden, this will make the added buttons visible
		newbutton.visible = true
		#changing the custom propertie named "level".this will be usefull for changing the scene later on
		newbutton.level = nodenumber
		#adding the newly configured button to the scene ad the child of the grid container
		$levelselectorscroll/levelselectorgrid.add_child(newbutton)
#get the files in a given directory
func get_files(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin(true)
	var file = dir.get_next()
	while file != '':
		files += [file]
		file = dir.get_next()
	return files


func _on_backbutton_pressed():
	get_tree().change_scene("res://scenes/UI.tscn")
	pass
