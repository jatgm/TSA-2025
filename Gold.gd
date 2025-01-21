extends CanvasLayer
@onready var first_item: Button = $Panel/FirstItem
@onready var second_item: Button = $Panel/SecondItem
@onready var third_item: Button = $Panel/ThirdItem

@export var gold = 10000


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/TextEdit.text = str(gold)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_first_item_pressed() -> void:
	if gold >= 5000:
		first_item.set_visible(false)
		gold -= 5000
		if gold < 0:
			gold = 0
		$Panel/TextEdit.text = str(gold)

func _on_second_item_pressed() -> void:
	if gold >= 5000:
		second_item.set_visible(false)
		gold -= 5000
		if gold < 0:
			gold = 0
		$Panel/TextEdit.text = str(gold)

func _on_third_item_pressed() -> void:
	if gold >= 5000:
		third_item.set_visible(false)
		gold -= 5000
		if gold < 0:
			gold = 0
		$Panel/TextEdit.text = str(gold)
