extends Node

var buff_array = ["ATK Buff", "ATK SP Buff", "CRIT DMG Buff", "CRIT RATE Buff"]
var total_items = 3
var random_items = []

@onready var first_text: TextEdit = $CanvasLayer/Panel/FirstItem/FirstText
@onready var second_text: TextEdit = $CanvasLayer/Panel/SecondItem/SecondText
@onready var third_text: TextEdit = $CanvasLayer/Panel/ThirdItem/ThirdText

@onready var first_item: Button = $CanvasLayer/Panel/FirstItem
@onready var second_item: Button = $CanvasLayer/Panel/SecondItem
@onready var third_item: Button = $CanvasLayer/Panel/ThirdItem

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Panel/TextEdit.text = str(Global.gold)
	randomize()
	buff_array.shuffle()
	random_items = buff_array.slice(0, total_items)
	first_text.text = random_items[0] + ": 100 Gold"
	second_text.text = random_items[1] + ": 100 Gold"
	third_text.text = random_items[2] + ": 100 Gold"
	
	print("Random Elements: ", random_items)	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func apply_buff(index: int) -> void:
	match random_items[0]:
		"ATK Buff":
			print("Your ATK has increased")
			Global.atk_dmg += 5
		"ATK SP Buff":
			print("Your ATK SP has increased")
			Global.atk_cooldown -= 0.2
		"CRIT DMG Buff":
			print("Your CRIT DMG has increased")
			Global.crit_dmg += 5
		"CRIT RATE Buff":
			print("Your CRIT RATE has increased")
			Global.crit_rate += 0.1


func _on_first_item_pressed() -> void:
	if Global.gold >= 100:
		first_item.set_visible(false)
		Global.gold -= 100
		Global.first_but = false
		if Global.gold < 0:
			Global.gold = 0
		$CanvasLayer/Panel/TextEdit.text = str(Global.gold)
		apply_buff(0)
	
func _on_second_item_pressed() -> void:
	if Global.gold >= 100:
		second_item.set_visible(false)
		Global.gold -= 100
		Global.second_but = false
		if Global.gold < 0:
			Global.gold = 0
		$CanvasLayer/Panel/TextEdit.text = str(Global.gold)
		apply_buff(1)

func _on_third_item_pressed() -> void:
	if Global.gold >= 100:
		third_item.set_visible(false)
		Global.gold -= 100
		Global.third_but = false
		if Global.gold < 0:
			Global.gold = 0
		$CanvasLayer/Panel/TextEdit.text = str(Global.gold)
		apply_buff(1)
