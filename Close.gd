extends Button

@onready var canvas_layer: CanvasLayer = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_pressed() -> void:
	Global.shop_open = false
	print("closed")
	$"../..".visible = false
