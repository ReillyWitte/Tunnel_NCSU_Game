extends StaticBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(_delta: float) -> void:
	if Globals.bat_wake == 1:  # or true if you're using bools
		if animated_sprite.animation != "flying":
			animated_sprite.play("flying")
	else:
		if animated_sprite.animation != "idle":
			animated_sprite.play("idle")
