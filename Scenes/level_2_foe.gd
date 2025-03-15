extends foe

var spritesheets = [preload("res://Images/enemy1spritesheet.png"),preload("res://Images/enemy2spritesheet.png")]
var rng = randi_range(0,spritesheets.size()-1)

func _ready() -> void:
	$Sprite2D.texture = spritesheets[rng]
