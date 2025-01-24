extends Node2D

var counter = 0

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			$CanvasLayer/TextureRect.visible = false
			counter+=1
			$AudioStreamPlayer.play()
			if counter >=2:
				get_tree().change_scene_to_file("res://Scenes/game.tscn")
