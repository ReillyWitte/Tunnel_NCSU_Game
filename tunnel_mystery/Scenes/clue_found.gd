extends AudioStreamPlayer2D



func _ready() -> void:
	var dialogic = get_node("/root/Dialogic")
	dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(event_name: String) -> void:
	print("Signal received:", event_name, Time.get_ticks_msec())
	if event_name == "clue_found":
		AudioManager.play_sfx(AudioManager.sfx_clue_found)
