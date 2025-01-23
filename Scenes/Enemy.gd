extends CharacterBody2D

var health = 50
var atk_dmg = 10
var atk_cooldown = 1.0
var atk_time = 0.0
var can_attack = true

@onready var attack_area: Area2D = $AttackArea
@onready var health_bar: ProgressBar = $HealthBar

func _ready():
	health_bar.value = health
	
func _physics_process(_delta):
	if not can_attack:
		atk_time -= _delta
		if atk_time <= 0:
			can_attack = true
	
	for body in attack_area.get_overlapping_bodies():
		if body.is_in_group("playertwo") and can_attack == true:
			print("in")
			atk_player(body)

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
	
	if health <= 0:
		die()

func die():
	print("Enemy died")
	
