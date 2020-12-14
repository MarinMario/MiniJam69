extends Control


func _process(delta):
	$Control.visible = get_tree().paused
	get_parent().get_node("Darkness").visible = !get_tree().paused


func _on_PAUSE_pressed():
	get_tree().paused = !get_tree().paused


func _on_BackToMenu_pressed():
	get_tree().change_scene("res://Menus/Menu.tscn")
	get_tree().paused = false


func _on_Restart_pressed():
	get_tree().change_scene("res://World/World.tscn")
	get_tree().paused = false


func _on_FullScreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_Resume_pressed():
	get_tree().paused = false
