extends Player


func _physics_process(_delta): # happens 60 times a sec, underscore can represent unused variable

	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	velocity = input_direction.normalized() * move_speed

	#built in function for characterbody new godot 4! :D
	move_and_slide()
	update_animation_parameters(input_direction)
	
	if not can_attack:
		atk_time -= _delta
		if atk_time <= 0:
			can_attack = true
	
	if Input.is_action_just_pressed("player_two_interact"):
		$Pivot/InteractionManager.initiate_interaction()
		attack()
