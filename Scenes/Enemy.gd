extends CharacterBody2D

class_name foe

var health = 50
var atk_dmg = 10
var atk_cooldown = 1.0
var atk_time = 0.0
var can_attack = true

@onready var attack_area: Area2D = $AttackArea
@onready var health_bar: ProgressBar = $HealthBar

@onready var playerone = $"../playerone"
@onready var playertwo = $"../playertwo"

func _ready():
	health_bar.value = health
	$AnimationPlayer.play("walking")
	
func _physics_process(_delta):
	
	var closer_player
	if position.distance_to(playerone.position) < position.distance_to(playertwo.position):
		closer_player = playerone
	else:
		closer_player = playertwo	
	
	velocity = Vector2.ZERO  

	if position.distance_to(closer_player.position) > 25:
		velocity = (position.direction_to(closer_player.position))*50
	else:
		velocity = Vector2.ZERO
		
	
	if not can_attack:
		atk_time -= _delta
		if atk_time <= 0:
			can_attack = true
	
	for body in attack_area.get_overlapping_bodies():
		if body.is_in_group("playertwo") and can_attack == true:
			print("in")
			atk_player(body)
			
	move_and_slide()

func atk_player(player):
	if not can_attack:
		return
	can_attack = false
	atk_time = atk_cooldown
	
	if player.has_method("take_damage"):
		player.take_damage(atk_dmg)
		
func take_damage(amount):
	
	health -= amount
	if health < 0:
		health = 0
	health_bar.value = health
	print("Enemy Health: ", health)
	$AudioStreamPlayer.play()
	
	if health <= 0:
		die()

func die():
	print("Enemy died")
	queue_free()
	
