extends Node2D

func _on_timer_timeout() -> void:
	Globals.time_remaining -= 1
	print(Globals.time_remaining)
	var minutes = Globals.time_remaining / 60
	var seconds = Globals.time_remaining % 60
	$labelmaker.text = str(minutes) + ":" + str(seconds)


func _on_ready() -> void:
	var minutes = Globals.time_remaining / 60
	var seconds = Globals.time_remaining % 60
	$labelmaker.text = str(minutes) + ":" + str(seconds) # Replace with function body.
