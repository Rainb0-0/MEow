extends CanvasLayer
signal unpause
signal mainmenu
func _on_unpausebutton_pressed():
	emit_signal("unpause")


func _on_titlemenubutton_pressed():
	emit_signal("mainmenu")
