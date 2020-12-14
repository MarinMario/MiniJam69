extends CanvasLayer

var card_count := 0

func _process(delta: float) -> void:
	$CardsCount.text = "Cards: " + str(card_count)  + "/3"
