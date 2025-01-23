extends Area2D

class_name InteractionManager

var current_interaction 

func initiate_interaction() -> void:
	if current_interaction != null:
		current_interaction.receive_interaction($"../../.") # gives the player

func receive_interaction(_interacter) -> void:
	pass # OVERWRITE THIS

func hover() -> void:
	pass
	
func unhover() -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	current_interaction = area
	
	
func _on_area_2d_area_exited(area: Area2D) -> void:
	if current_interaction == area:
		current_interaction = null

func _on_area_entered(area: Area2D) -> void:
	current_interaction = area
	hover()

func _on_area_exited(_area: Area2D) -> void:
	current_interaction = null
	unhover()
