extends TextureButton

export var text := "put your text here"

func _ready():
	$Label.text = text

