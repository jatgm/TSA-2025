extends "res://Scripts/game.gd"

@onready var level2foe = preload("res://Scenes/level2foe.tscn")
@onready var ticket2 = preload("res://Scenes/ticketLVL2.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/DayTwoLabel/AnimationPlayer.play("fade")
	$CanvasModulate/AnimationPlayer.play("daytonight")
	Global.shop_open = true
	$piano.play()
	
func instantiate_foe():
	add_child(level2foe.instantiate())

func instantiate_ticket():
	print("does this acutally run?")
	$CanvasLayer/Control/tickets.add_child(ticket2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func meow():
	get_tree().change_scene_to_file("res://Scenes/LEVELSEVEN.tscn")

func _on_timer_timeout() -> void:
	print("EPDSKLJDFKL:SJDF:LKSJDF:LKSDJF:KLSDF:JK")
	$CanvasLayer/Control/tickets.add_child(ticket2.instantiate())
	if fighting_stage && counter <= 10 && time_remaining != 0:
		instantiate_foe()
		counter += 1	
