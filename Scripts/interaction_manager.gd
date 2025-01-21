extends Area2D

class_name InteractionManager

var current_interaction : InteractionManager

func initiate_interaction() -> void:
	if current_interaction != null:
		current_interaction.recieve_interaction($"../../.") # gives the cat

func receive_interaction(interacter) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	current_interaction = area
	
	
func _on_area_2d_area_exited(area: Area2D) -> void:
	if current_interaction == area:
		current_interaction = null

func _on_area_entered(area: Area2D) -> void:
	print("enttered")
	current_interaction = area
	pass # Replace with function body.

func _on_area_exited(area: Area2D) -> void:
	current_interaction = null
