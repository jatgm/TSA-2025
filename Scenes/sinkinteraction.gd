extends ApplianceInteractionManager

func receive_interaction(interacter) -> void:
	if interacter.state == interacter.HOLDING_FLOUR:
		interacter.advance(interacter.HOLDING_DOUGH)
