extends ApplianceInteractionManager

func receive_interaction(interacter) -> void:
	if interacter.state == interacter.HOLDING_DOUGH:
		interacter.advance(interacter.HOLDING_BREAD)
		$"../AudioStreamPlayer2D".play()
	
	if interacter.state == interacter.HOLDING_SUGARDOUGH:
		interacter.advance(interacter.HOLDING_CINNAMON_ROLL)
		$"../AudioStreamPlayer2D".play()
	if interacter.state == interacter.HOLDING_DOUGH_BUTTER:
		interacter.advance(interacter.HOLDING_CROISSANT)
		$"../AudioStreamPlayer2D".play()
	if interacter.state == interacter.HOLDING_MIXED_DOUGH_BUTTER_SUGAR:
		interacter.advance(interacter.HOLDING_CAKE)
		$"../AudioStreamPlayer2D".play()
