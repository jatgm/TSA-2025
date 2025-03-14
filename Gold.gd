extends CanvasLayer
@onready var first_item: Button = $Panel/FirstItem
@onready var second_item: Button = $Panel/SecondItem
@onready var third_item: Button = $Panel/ThirdItem


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/TextEdit.text = str(Global.gold)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_first_item_pressed() -> void:
	if Global.gold >= 100:
		first_item.set_visible(false)
		Global.gold -= 100
		Global.first_but = false
		if Global.gold < 0:
			Global.gold = 0
		$Panel/TextEdit.text = str(Global.gold)
		Buff.apply_buff(0)

func _on_second_item_pressed() -> void:
	if Global.gold >= 100:
		second_item.set_visible(false)
		Global.gold -= 100
		Global.second_but = false
		if Global.gold < 0:
			Global.gold = 0
		$Panel/TextEdit.text = str(Global.gold)
		Buff.apply_buff(1)

func _on_third_item_pressed() -> void:
	if Global.gold >= 100:
		third_item.set_visible(false)
		Global.gold -= 100
		Global.third_but = false
		if Global.gold < 0:
			Global.gold = 0
		$Panel/TextEdit.text = str(Global.gold)
		Buff.apply_buff(1)
