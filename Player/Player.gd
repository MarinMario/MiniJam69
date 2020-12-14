extends KinematicBody2D

export var speed := 500
var anim := "idle"

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			$AnimatedSprite.scale.x = 2
		elif input_vector.x < 0:
			$AnimatedSprite.scale.x = -2
		anim = "walk"
	else:
		anim = "idle"

	if Input.is_action_just_pressed("click") and $PlayerStats.card_count > 0:
		Sounds.get_node("ThrowCard").play()
		var card := preload("res://Card/Card.tscn").instance()
		card.speed = 1000
		card.dir = (get_global_mouse_position() - position).normalized()
		card.global_position = global_position
		card.rotation = atan2(card.dir.y, card.dir.x) + deg2rad(90)
		get_parent().add_child(card)
		$PlayerStats.card_count -= 1
	
	move_and_slide(input_vector * speed)
	$AnimatedSprite.play(anim)
