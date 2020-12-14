extends Control

func _ready():
	if Sounds.get_node("DevilDeath").playing:
		$Label.text = "You Win"
	else:
		$Label.text = "You Lose"


func _on_PlayAgain_pressed():
	get_tree().change_scene("res://World/World.tscn")


func _on_BackToMenu_pressed():
	get_tree().change_scene("res://Menus/Menu.tscn")
