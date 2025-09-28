extends Node2D

func _on_ready() -> void:
	if Globals.luggage_labels == 0:
		if Globals.luggage_paper == 1:
			Globals.luggage_dialog = 1
			Globals.luggage_labels = 1
			Dialogic.start("luggage_timeline")
			$Label.visible = true
