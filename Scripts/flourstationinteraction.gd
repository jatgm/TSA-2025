extends ApplianceInteractionManager

func receive_interaction(interacter) -> void:
	if interacter.state == interacter.EMPTY:
		interacter.advance(interacter.HOLDING_FLOUR)
