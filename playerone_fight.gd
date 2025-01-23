extends CharacterBody2D


@export var move_speed : float = 150
@export var starting_direction : Vector2 = Vector2(0, 1)
@onready var state_machine = $AnimationTree.get("parameters/playback")

var health = 100
var atk_dmg = 10
var atk_cooldown = 0.5
var atk_time = 0.0
var can_attack = true
var crit_dmg = 5
var crit_rate = 0.2

@onready var attack_range: Area2D = $AttackRange

func _physics_process(_delta): # happens 60 times a sec, underscore can represent unused variable

	var input_direction = Vector2(
		Input.get_action_strength("player_one_right") - Input.get_action_strength("player_one_left"),
		Input.get_action_strength("player_one_down") - Input.get_action_strength("player_one_up")
	)
	velocity = input_direction.normalized() * move_speed

	#built in function for characterbody new godot 4! :D
	move_and_slide()
	update_animation_parameters(input_direction)
	
	if not can_attack:
		atk_time -= _delta
		if atk_time <= 0:
			can_attack = true
			
	
	if Input.is_action_just_pressed("player_one_attack"):
		attack()

func update_animation_parameters(move_input : Vector2):
	if move_input != Vector2.ZERO:
		state_machine.travel("walk")
		$AnimationTree.set("parameters/walk/blend_position", move_input)
		$AnimationTree.set("parameters/idle/blend_position", move_input)
	else:
		state_machine.travel("idle")

func attack():
	if not can_attack:
		return
	can_attack = false
	atk_time = atk_cooldown
	
	var crit_roll = randf()
	if crit_roll <= crit_rate:
		atk_dmg += crit_dmg
	
	for body in attack_range.get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage(atk_dmg)
	atk_dmg = 10

func take_damage(amount):
	health -= amount
	print("PLayer Health: ", health)
	
	if health <= 0:
		die()

func die():
	print("Player died")
	
		
	
