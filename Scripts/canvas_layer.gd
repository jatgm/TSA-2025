extends CanvasLayer

@export var gold = 10000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/TextEdit.text = str(gold)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	$Panel/Button.set_visible(false)
	gold -= 5000
	$Panel/TextEdit.text = str(gold)
	
