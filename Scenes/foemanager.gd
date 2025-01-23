extends InteractionManager

func hover() -> void:
	$"../Sprite2D".material.set_shader_parameter("opacity", 0.4)
	
func unhover() -> void:
	$"../Sprite2D".material.set_shader_parameter("opacity", 0)
