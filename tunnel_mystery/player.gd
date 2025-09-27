extends CharacterBody2D

@export var speed = 400


var animated_sprite: AnimatedSprite2D  # reference to the sprite

func _ready():
	# Get AnimatedSprite2D
	animated_sprite = $AnimatedSprite2D
	
	if Globals.door_side == Globals.LEFT:
		position = Vector2(110,400)
	elif Globals.door_side == Globals.RIGHT:
		position = Vector2(1040,400)


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	# Animation handling
	if input_direction == Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")
		
		# Flip depending on direction (optional, for left/right)
		if Dialogic.current_timeline == null:
			if input_direction.x < 0:
				animated_sprite.flip_h = true
			elif input_direction.x > 0:
				animated_sprite.flip_h = false

func _physics_process(_delta):
	if Dialogic.current_timeline == null:
		get_input()
	move_and_slide()
