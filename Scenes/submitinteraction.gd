extends ApplianceInteractionManager

signal submit(type)

func receive_interaction(interacter) -> void:
	if interacter.state == interacter.HOLDING_BREAD:
		emit_signal("submit",interacter.HOLDING_BREAD)
		interacter.advance(interacter.EMPTY)
		$"../AudioStreamPlayer2D".play()
	if interacter.state == interacter.HOLDING_CINNAMON_ROLL:
		emit_signal("submit",interacter.HOLDING_CINNAMON_ROLL)
		interacter.advance(interacter.EMPTY)
		$"../AudioStreamPlayer2D".play()
