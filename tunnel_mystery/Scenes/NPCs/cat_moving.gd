extends StaticBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(_delta: float) -> void:
	if Globals.blue_ticket == 1:  # or true if you're using bools
		if animated_sprite.animation != "sleeping_noticket":
			animated_sprite.play("sleeping_noticket")
	else:
		if animated_sprite.animation != "sleeping":
			animated_sprite.play("sleeping")
