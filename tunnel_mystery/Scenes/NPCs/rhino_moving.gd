extends StaticBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(_delta: float) -> void:
	if Globals.rhino_nice == 1:  # or true if you're using bools
		if animated_sprite.animation != "happy":
			animated_sprite.play("happy")
	else:
		if animated_sprite.animation != "angry":
			animated_sprite.play("angry")
