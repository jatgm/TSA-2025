extends Control

@export var y_offset = 0
var list_of_food = ["bread","crossaint","muffin","baguette","cupcake","cake","garlic bread","milk tea","cappucino"]

func _ready() -> void:
	$Panel/RichTextLabel.text= list_of_food[randi_range(0,list_of_food.size()-1)]
	$AnimationPlayer.play("drop")
	


func _physics_process(delta: float) -> void:
	position.y += y_offset
	$Panel/ProgressBar.value -= .1
	if $Panel/ProgressBar.value <= 0:
		queue_free()
