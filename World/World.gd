extends Node2D

var strange_noise_timer := 10.0

func _process(delta: float) -> void:
	if $Player.position.distance_to($Devil.position) < 100 && $Devil.health > 0:
		get_tree().change_scene("res://Menus/EndScreen.tscn")
		Sounds.get_node("Die").play()
	
	strange_noise_timer += delta
	if strange_noise_timer > 10:
		randomize()
		strange_noise_timer = 0
		Sounds.strange_noises[randi() % Sounds.strange_noises.size()].play()
	
