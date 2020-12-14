extends Area2D

var speed = 200
var health = 3
onready var nav = get_parent().get_node("Navigation2D")
onready var player = get_parent().get_node("Player")
var state = "fine"

func _process(delta: float) -> void:
	if health > 0:
		$AnimationPlayer.play("float")
		var path = nav.get_simple_path(position, player.position)
		position += (path[1] - position).normalized() * speed * delta
		
		if position.distance_to(player.position) < 500:
			speed = 400
		else:
			speed = 200
		
		if position.distance_to(player.position) < 800 and Sounds.get_node("DevilMeet").playing == false:
			Sounds.get_node("DevilMeet").play()
		
	$Sprite.play(state)


func _on_Devil_area_entered(area):
	if area.is_in_group("card") and area.speed != 0:
		health -= 1
		area.queue_free()
		Sounds.get_node("Hit").play()
	
	if health <= 0:
		die()

func die():
	$AnimationPlayer.play("die")
	Sounds.get_node("DevilDeath").play()
	state = "bad"


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		get_tree().change_scene("res://Menus/EndScreen.tscn")
