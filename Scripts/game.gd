extends Node

@onready var ticket = preload("res://Scenes/ticket.tscn")
@onready var foe = preload("res://Scenes/foe.tscn")


var time_remaining = 60
var counter = 0
var fighting_stage = false

func _on_button_pressed() -> void:
	var ticket = ticket.instantiate()
	$CanvasLayer/Control/tickets.add_child(ticket)

func _ready() -> void:
	$CanvasModulate/AnimationPlayer.play("daytonight")
	$piano.play()

func _on_interaction_manager_submit(type: Variant) -> void:
	for child in $CanvasLayer/Control/tickets.get_children():
		if child.rng == 0 && type == 3:
			child.queue_free()
			break
		if child.rng == 1 && type == 5:
			child.queue_free()
			break


func transition():
	$piano.stream_paused = true
	$battle_music.play()
	$CanvasLayer/Control/tickets.visible = false
	$CanvasLayer/transitionmessage.visible = true
	time_remaining = 20
	
	fighting_stage = true
	
func _on_timer_timeout() -> void:
	var ticket = ticket.instantiate()
	$CanvasLayer/Control/tickets.add_child(ticket)
	if fighting_stage && counter <= 10 && time_remaining != 0:
		add_child(foe.instantiate())
		counter += 1	

func _on_game_timer_timeout() -> void:
	if time_remaining > 0:
		time_remaining -=1
	
	if time_remaining <= 0 && fighting_stage == true && get_tree().get_nodes_in_group("foes").size()==0:
		get_tree().change_scene_to_file("res://Scenes/endoflevel.tscn")
	if time_remaining <= 0 && fighting_stage == false:
		transition() #will continiously run this
	
	
	else:
		if fighting_stage:
			$CanvasLayer/timeremaining.text = "Enemy Spawning Phase: " + str(time_remaining)
		else:
			$CanvasLayer/timeremaining.text = "Time Remaining: " + str(time_remaining)
