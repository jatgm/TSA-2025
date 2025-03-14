extends ApplianceInteractionManager

func receive_interaction(interacter) -> void:
	if interacter.state == interacter.HOLDING_DOUGH:
		interacter.advance(interacter.HOLDING_SUGARDOUGH)
		$"../AudioStreamPlayer2D".play()
	if interacter.state == interacter.HOLDING_DOUGH_BUTTER:
		interacter.advance(interacter.HOLDING_DOUGH_BUTTER_SUGAR)
		$"../AudioStreamPlayer2D".play()
