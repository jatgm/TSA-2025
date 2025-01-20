extends TextEdit

@onready var timer: Timer = $"../../Timer"
@onready var time: TextEdit = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time.text = str(timer.wait_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
