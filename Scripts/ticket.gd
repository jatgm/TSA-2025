extends Control

var list_of_food = ["bread","crossaint","muffin","baguette"]

func _ready() -> void:
	$Panel/RichTextLabel.text= list_of_food[randi_range(0,list_of_food.size()-1)]

func _physics_process(delta: float) -> void:
	$Panel/ProgressBar.value -= 1
	if $Panel/ProgressBar.value <= 0:
		queue_free()
