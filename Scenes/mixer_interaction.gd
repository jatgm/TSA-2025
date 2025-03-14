extends ApplianceInteractionManager


func receive_interaction(interacter) -> void:
	if interacter.state == interacter.HOLDING_DOUGH_BUTTER_SUGAR:
		interacter.advance(interacter.HOLDING_MIXED_DOUGH_BUTTER_SUGAR)
		$"../AudioStreamPlayer2D".play()
