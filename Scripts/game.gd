extends Node

@onready var ticket = preload("res://Scenes/ticket.tscn")

func _on_button_pressed() -> void:
	$CanvasLayer/Control/tickets.add_child(ticket.instantiate())
