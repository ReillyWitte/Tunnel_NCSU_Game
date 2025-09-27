extends CanvasLayer

@onready var fade_rect = $ColorRect
var fade_time: float = 1.0  # duration of fade in seconds

# Fade in (from black to transparent)
func fade_in():
	fade_rect.visible = true
	fade_rect.modulate.a = 1.0
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, fade_time)
	tween.finished.connect(Callable(self, "_hide_fade_rect"))

func fade_out(callback: Callable):
	fade_rect.visible = true
	fade_rect.modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, fade_time)
	tween.finished.connect(callback)

func _hide_fade_rect():
	fade_rect.visible = false

# Change scene with fade in/out
func change_scene(scene_path: String, position: Vector2 = Vector2.ZERO):
	fade_out(Callable(self, "_on_fade_out_complete").bind(scene_path, position))

func _on_fade_out_complete(scene_path: String, position: Vector2):
	# Load and instantiate the new scene
	var new_scene = load(scene_path).instantiate()
	# Optional: set start position if the scene has a 'position' property
	if new_scene.has_method("set_position"):
		new_scene.set_position(position)
	get_tree().change_scene_to_packed(new_scene)
	
	# Fade in the new scene
	fade_in()
