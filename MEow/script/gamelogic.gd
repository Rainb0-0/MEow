extends Node2D
signal levelcompleted
export var lowpoint = 500
var score = 0 
var pausescene = preload("res://scenes/pausemenu.tscn")
var levelcompletedscene = preload("res://scenes/levelcompleted.tscn")
var gameoverscene = preload("res://scenes/gameover.tscn")
func _ready():
	pass
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		var pauseinstance = pausescene.instance()
		if $pausechecknode.get_child_count() == 0:
			$pausechecknode.add_child(pauseinstance)
			var pausemenu = $pausechecknode.get_children()
			pausemenu[0].connect("unpause", self, "unpause")
			pausemenu[0].connect("mainmenu", self, "mainmenu")
			pause_node($cat, true)
		else:
			$pausechecknode.get_child(0).queue_free()
			pause_node($cat, false)
	if $Node.get_child_count() == 0:
		if $levelcompletedchecknode.get_child_count() == 0:
			var levelcompletedisntance = levelcompletedscene.instance()
			$levelcompletedchecknode.add_child(levelcompletedisntance)
			get_tree().paused = true
	if $cat.position.y > lowpoint:
		gameover()
	pass
func unpause():
	$pausechecknode.get_child(0).queue_free()
	pause_node($cat, false)
func mainmenu():
	get_tree().change_scene("res://scenes/UI.tscn")
func addscore():
	score += 1
	$hud/score.text = str(score)
	pass
func _on_fish_fish_eaten():
	addscore()
	pass 
func pause_node(node: Node, pause: bool):
	node.set_process(!pause)
	node.set_process_input(!pause)
	node.set_process_internal(!pause)
	node.set_process_unhandled_input(!pause)
	node.set_process_unhandled_key_input(!pause)
func _on_tilemapcollision_body_entered(body):
	if body.get_name() == "cat":
		gameover()
	pass
func gameover():
	get_tree().paused = true
	var gameoverinstance = gameoverscene.instance()
	add_child(gameoverinstance)
	pass
