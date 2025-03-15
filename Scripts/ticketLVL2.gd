extends Control

@export var y_offset = 0
var list_of_food = ["1x Bread","1x Cinnamon Roll", "1x Croissant", "1x Cake"]
var rng = randi_range(0,list_of_food.size()-1)

func _ready() -> void:
	$ColorRect/RichTextLabel.text= list_of_food[rng]
	if rng == 0:
		$ColorRect/RichTextLabel2.text = "Flour > Sink > Oven"
		$ColorRect/RichTextLabel3.text = "[right]$10.00[/right]"
	if rng == 1:
		$ColorRect/RichTextLabel2.text = "Flour > Sink > Sugar > Oven"
		$ColorRect/RichTextLabel3.text = "[right]$15.00[/right]"
	if rng == 2:
		$ColorRect/RichTextLabel2.text = "Flour > Sink > Butter > Oven"
		$ColorRect/RichTextLabel3.text = "[right]$20.00[/right]"
	if rng == 3:
		$ColorRect/RichTextLabel2.text = "Flour > Sink > Butter > Sugar > Mixer > Oven"
		$ColorRect/RichTextLabel3.text = "[right]$30.00[/right]"
	
	

func _physics_process(_delta: float) -> void:
	position.y += y_offset
	$ColorRect/ProgressBar.value -= .1
	if $ColorRect/ProgressBar.value <= 0:
		queue_free()
