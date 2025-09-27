extends CanvasLayer

@onready var fade_rect = $ColorRect
var fade_time = 1.0 # seconds

func _on_fade_in_complete():
	fade_rect.visible = false

func fade_in():
	fade_rect.visible = true
	fade_rect.modulate.a = 1.0
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, fade_time)
	tween.finished.connect(Callable(self, "_on_fade_in_complete"))


func fade_out(callback: Callable):
	fade_rect.visible = true
	fade_rect.modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, fade_time)
	tween.finished.connect(callback) # run code after fade finishes
