extends Node

var buff_array = ["ATK Buff", "ATK SP Buff", "CRIT DMG Buff", "CRIT RATE Buff"]
var icon_array = [preload("res://Images/AtkSymbolIcon.png"),preload("res://Images/AtkSpeedIcon.png"),preload("res://Images/CritDmgIcon.png"),preload("res://Images/CritRateIcon.png")]
var rng = [0,1,2,3]
var total_items = 3
var random_items = []

@onready var first_text: RichTextLabel = $CanvasLayer/Panel/FirstItem/RichTextLabel
@onready var second_text: RichTextLabel = $CanvasLayer/Panel/SecondItem/RichTextLabel
@onready var third_text: RichTextLabel = $CanvasLayer/Panel/ThirdItem/RichTextLabel

@onready var first_item: Button = $CanvasLayer/Panel/FirstItem
@onready var second_item: Button = $CanvasLayer/Panel/SecondItem
@onready var third_item: Button = $CanvasLayer/Panel/ThirdItem

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Panel/RichTextLabel.text = str(Global.gold)
	randomize()
	rng.shuffle()
	
	first_text.text = buff_array[rng[0]] + ": 100 Gold"
	first_item.icon = icon_array[rng[0]]
	
	second_text.text = buff_array[rng[1]] + ": 100 Gold"
	second_item.icon = icon_array[rng[1]]
	
	third_text.text = buff_array[rng[2]] + ": 100 Gold"
	third_item.icon = icon_array[rng[2]]
	
	print("Random Elements: ", random_items)	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func apply_buff(index: int) -> void:
	match buff_array[index]:
		"ATK Buff":
			print("Your ATK has increased")
			Global.atk_dmg += 5
		"ATK SP Buff":
			print("Your ATK SP has increased")
			if Global.atk_cooldown-0.2>=0:
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
		$CanvasLayer/Panel/RichTextLabel.text = str(Global.gold)
		apply_buff(0)
	
func _on_second_item_pressed() -> void:
	if Global.gold >= 100:
		second_item.set_visible(false)
		Global.gold -= 100
		Global.second_but = false
		if Global.gold < 0:
			Global.gold = 0
		$CanvasLayer/Panel/RichTextLabel.text = str(Global.gold)
		apply_buff(1)

func _on_third_item_pressed() -> void:
	if Global.gold >= 100:
		third_item.set_visible(false)
		Global.gold -= 100
		Global.third_but = false
		if Global.gold < 0:
			Global.gold = 0
		$CanvasLayer/Panel/RichTextLabel.text = str(Global.gold)
		apply_buff(1)
