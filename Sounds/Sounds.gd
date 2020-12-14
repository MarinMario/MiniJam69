extends Node

onready var strange_noises := [$Strange1, $Strange2, $Strange3, $Strange4, $Strange5, $Strange6, $Strange7]

func _on_DevilDeath_finished():
	$Win.play()
