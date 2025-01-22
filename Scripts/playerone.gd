extends CharacterBody2D

class_name Player

@export var move_speed : float = 150
@export var starting_direction : Vector2 = Vector2(0, 1)
@onready var state_machine = $AnimationTree.get("parameters/playback")

func _physics_process(_delta): # happens 60 times a sec, underscore can represent unused variable

	var input_direction = Vector2(
		Input.get_action_strength("player_one_right") - Input.get_action_strength("player_one_left"),
		Input.get_action_strength("player_one_down") - Input.get_action_strength("player_one_up")
	)
	velocity = input_direction.normalized() * move_speed

	#built in function for characterbody new godot 4! :D
	move_and_slide()
	update_animation_parameters(input_direction)
	
	if Input.is_action_just_pressed("player_one_interact"):
		$Pivot/InteractionManager.initiate_interaction()

func update_animation_parameters(move_input : Vector2):
	if move_input != Vector2.ZERO:
		state_machine.travel("walk")
		$AnimationTree.set("parameters/walk/blend_position", move_input)
		$AnimationTree.set("parameters/idle/blend_position", move_input)
	else:
		state_machine.travel("idle")
		
	
