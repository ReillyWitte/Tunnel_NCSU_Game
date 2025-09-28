extends Node

# Optional: preload common SFX
var sfx_clue_found = preload("res://Audio Files/cluefound.mp3")
var sfx_train_sounds = preload("res://Audio Files/trainsounds.mp3")

func play_sfx(stream: AudioStream) -> void:
	var player = AudioStreamPlayer2D.new()
	add_child(player)
	player.stream = stream
	player.play()
	player.finished.connect(player.queue_free)


func _ready() -> void:
	var dialogic = get_node("/root/Dialogic")
	dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(event_name: String) -> void:
	print("Signal received:", event_name)
	if event_name == "clue_found":
		play_sfx(sfx_clue_found)
