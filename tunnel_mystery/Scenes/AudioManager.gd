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
