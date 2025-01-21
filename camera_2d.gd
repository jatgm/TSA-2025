extends Camera2D

func _physics_process(delta: float) -> void:
	position = position.lerp(Vector2(($"../playerone".position.x + $"../playertwo".position.x)/2, ($"../playerone".position.y + $"../playertwo".position.y)/2), 5*delta)
