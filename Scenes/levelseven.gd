extends "res://Scripts/game.gd"

@onready var boss = preload("res://Scenes/boss.tscn")
@onready var ticket2 = preload("res://Scenes/ticketLVL2.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/DayTwoLabel/AnimationPlayer.play("fade")
	$CanvasModulate/AnimationPlayer.play("daytonight")
	Global.shop_open = true
	$piano.play()
	
func instantiate_foe():
	var boss_instance = boss.instantiate()
	
	boss_instance.position = $spawnpoint.position
	add_child(boss_instance)

func instantiate_ticket():
	$CanvasLayer/Control/tickets.add_child(ticket2.instantiate())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func meow():
	get_tree().change_scene_to_file("res://Scenes/endoflevel.tscn")

func _on_ticket_timer_timeout() -> void:
	print("EPDSKLJDFKL:bbbbbbbbbbbbbb:LKSJDF:LKSDJF:KLSDF:JK")
	$CanvasLayer/Control/tickets.add_child(ticket2.instantiate())
	if fighting_stage && counter <= 10 && time_remaining != 0:
		instantiate_foe()
		counter += 1	
