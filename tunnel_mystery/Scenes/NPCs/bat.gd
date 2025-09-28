extends StaticBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var last_direction := 1  # tracks last movement direction

func _process(_delta: float) -> void:
	# Get parent's movement direction
	var path_parent = get_parent() as PathFollow2D
	if path_parent == null:
		return

	# Flip sprite if direction changed
	if path_parent.direction != last_direction:
		anim.flip_h = not anim.flip_h
		last_direction = path_parent.direction

	# Play flying animation if awake
	if Globals.bat_wake == 1:
		if anim.animation != "flying":
			anim.play("flying")
	else:
		if anim.animation != "idle":
			anim.play("idle")
