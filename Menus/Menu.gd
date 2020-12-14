extends Control

func _ready():
	Sounds.get_node("IntroMusic").play()


func _on_Play_pressed():
	get_tree().change_scene("res://World/World.tscn")
	Sounds.get_node("IntroMusic").stop()


func _on_Quit_pressed():
	get_tree().quit()


func _on_FullScreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
