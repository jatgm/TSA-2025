extends InteractionManager

class_name ApplianceInteractionManager  

func hover() -> void:
	$"../ColorRect".color.a = .25
	
func unhover() -> void:
	$"../ColorRect".color.a = 0
