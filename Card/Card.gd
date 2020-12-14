extends Area2D

var speed := 0
var dir := Vector2.ZERO


func _on_Card_body_entered(body) -> void:
	if body.name == "Player" and speed == 0:
		queue_free()
		body.get_node("PlayerStats").card_count += 1
	
	if body is TileMap:
		speed = 0


func _process(delta: float) -> void:
	global_position += dir * speed * delta
