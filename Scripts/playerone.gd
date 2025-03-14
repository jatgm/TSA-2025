extends CharacterBody2D

class_name Player

@export var move_speed : float = 150
@export var starting_direction : Vector2 = Vector2(0, 1)
@onready var state_machine = $AnimationTree.get("parameters/playback")

var atk_time = 0.0
var can_attack = true


enum {
	EMPTY, 
	HOLDING_FLOUR,
	HOLDING_DOUGH,
	HOLDING_BREAD,
	HOLDING_SUGARDOUGH,
	HOLDING_CINNAMON_ROLL,
	HOLDING_BAGUETTE,
	#
	HOLDING_DOUGH_BUTTER,
	HOLDING_CROISSANT,
	HOLDING_DOUGH_BUTTER_SUGAR,
	HOLDING_MIXED_DOUGH_BUTTER_SUGAR,
	HOLDING_CAKE
}
var state = EMPTY

func advance(step):
	state = step
	match state:
		EMPTY:
			print("test")
			$Pivot/item/AnimationPlayer.play("RESET")
			$Pivot/item.texture = null

		HOLDING_FLOUR:
			$Pivot/item.texture = load("res://Images/flourspritesheet.png")
		HOLDING_DOUGH:
			$Pivot/item.texture = load("res://Images/doughspritesheet.png")
			$Pivot/item/AnimationPlayer.play("dough animation")
		
		HOLDING_BREAD:
			var possible_bread_sprites = ["res://Images/breadspritesheet.png","res://Images/sourdoughspritesheet.png","res://Images/baguettespritesheet.png"]
			var rng = randi_range(0,2)
			if rng != 0:
				$Pivot/item/AnimationPlayer.play("RESET")
			$Pivot/item.texture = load(possible_bread_sprites[rng])
			
		HOLDING_CINNAMON_ROLL:
			$Pivot/item.texture = load("res://Images/cinnamonrollspritesheet.png")
			$Pivot/item.material.set_shader_parameter("opacity", 0)
			$Pivot/item/AnimationPlayer.play("RESET")
		HOLDING_BAGUETTE:
			$Pivot/item.texture = load("res://Images/baguettespritesheet.png")
		HOLDING_SUGARDOUGH:
			$Pivot/item.material.set_shader_parameter("flash_color", Color(255,255,255))
			$Pivot/item.material.set_shader_parameter("opacity", .001)
		
		HOLDING_DOUGH_BUTTER:
			$Pivot/item.material.set_shader_parameter("flash_color", Color(255,255,0))
			$Pivot/item.material.set_shader_parameter("opacity", .001)

		HOLDING_CROISSANT:
			$Pivot/item.texture = load("res://Images/croissant.png")
			$Pivot/item.material.set_shader_parameter("opacity", 0)
			$Pivot/item/AnimationPlayer.play("RESET")
		
		HOLDING_DOUGH_BUTTER_SUGAR:
			$Pivot/item.texture = load("res://Images/cakepremixed.png")
			$Pivot/item.material.set_shader_parameter("opacity", 0)
			$Pivot/item/AnimationPlayer.play("RESET")
		HOLDING_MIXED_DOUGH_BUTTER_SUGAR:
			$Pivot/item.texture = load("res://Images/cakepostmixed.png")
			$Pivot/item.material.set_shader_parameter("opacity", 0)
			$Pivot/item/AnimationPlayer.play("RESET")
		
		
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
	
	if Input.is_action_just_pressed("player_one_interact"):
		$Pivot/InteractionManager.initiate_interaction()
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
	atk_time = Global.atk_cooldown
	
	var crit_roll = randf()
	if crit_roll <= Global.crit_rate:
		Global.atk_dmg += Global.crit_dmg
	
	for body in $Pivot/AttackRange.get_overlapping_bodies():
		if body.has_method("take_damage"):
			body.take_damage(Global.atk_dmg)
	Global.atk_dmg = 10

func take_damage(amount):
	Global.health -= amount
	print("PLayer Health: ", Global.health)
	
	if Global.health <= 0:
		die()

func die():
	print("Player died")
	
		
	
