extends CharacterBody2D

@export var move_speed : float = 500
@export var starting_direction : Vector2 = Vector2(0, 1)

func _physics_process(_delta): # happens 60 times a sec, underscore can represent unused variable

	var input_direction = Vector2(
		Input.get_action_strength("player_one_right") - Input.get_action_strength("player_one_left"),
		Input.get_action_strength("player_one_down") - Input.get_action_strength("player_one_up")
	)
	velocity = input_direction.normalized() * move_speed

	#built in function for characterbody new godot 4! :D
	move_and_slide()
