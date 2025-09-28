extends StaticBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(_delta: float) -> void:
	if Globals.mole_smoke == 1:  # or true if you're using bools
		if animated_sprite.animation != "walking":
			animated_sprite.flip_h = true
			animated_sprite.play("walking")
	else:
		if animated_sprite.animation != "idle":
			animated_sprite.play("idle")
