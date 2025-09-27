extends StaticBody2D


var animated_bat = AnimatedSprite2D



func _process(_delta):
	animated_bat = $AnimatedSprite2D
	if Globals.wake_bat == 1:
		animated_bat.play("flying")
