extends Node

var buff_array = ["ATK Buff", "HP Buff", "ATK SP Buff", "CRIT DMG Buff", "CRIT RATE Buff"]
var total_items = 3
var random_items = []
@onready var first_text: TextEdit = $CanvasLayer/Panel/FirstItem/FirstText
@onready var second_text: TextEdit = $CanvasLayer/Panel/SecondItem/SecondText
@onready var third_text: TextEdit = $CanvasLayer/Panel/ThirdItem/ThirdText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	buff_array.shuffle()
	random_items = buff_array.slice(0, total_items)
	first_text.text = random_items[0] + ": 5000 Gold"
	second_text.text = random_items[1] + ": 5000 Gold"
	third_text.text = random_items[2] + ": 5000 Gold"
	
	print("Random Elements: ", random_items)	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_first_item_pressed() -> void:
	match random_items[0]:
		"ATK Buff":
			print("Your ATK has increased")
		"HP Buff":
			print("Your HP has increased")
		"ATK SP Buff":
			print("Your ATK SP has increased")
		"CRIT DMG Buff":
			print("Your CRIT DMG has increased")
		"CRIT RATE Buff":
			print("Your CRIT RATE has increased")

func _on_second_item_pressed() -> void:
	match random_items[0]:
		"ATK Buff":
			print("Your ATK has increased")
		"HP Buff":
			print("Your HP has increased")
		"ATK SP Buff":
			print("Your ATK SP has increased")
		"CRIT DMG Buff":
			print("Your CRIT DMG has increased")
		"CRIT RATE Buff":
			print("Your CRIT RATE has increased")


func _on_third_item_pressed() -> void:
	match random_items[0]:
		"ATK Buff":
			print("Your ATK has increased")
		"HP Buff":
			print("Your HP has increased")
		"ATK SP Buff":
			print("Your ATK SP has increased")
		"CRIT DMG Buff":
			print("Your CRIT DMG has increased")
		"CRIT RATE Buff":
			print("Your CRIT RATE has increased")
