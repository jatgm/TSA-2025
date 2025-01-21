extends TextEdit

@onready var timer: Timer = $"../../Timer"
@onready var time: TextEdit = $"."
@onready var canvas_layer: CanvasLayer = $"../../CanvasLayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time.text = str(timer.wait_time)
	canvas_layer.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time.text = str(timer.time_left)


func _on_timer_timeout() -> void:
	canvas_layer.visible = true
