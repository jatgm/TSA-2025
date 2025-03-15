extends "res://Scripts/game.gd"


@onready var boss = preload("res://Scenes/boss.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/DayTwoLabel/AnimationPlayer.play("fade")
	
func instantiate_foe():
	add_child(boss.instantiate())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func meow():
	get_tree().change_scene_to_file("res://Scenes/LEVELTHREE.tscn")
