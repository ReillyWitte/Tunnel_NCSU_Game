extends CharacterBody2D

@export var speed = 400

func _ready():	
	if Globals.door_side == Globals.LEFT:
		position = Vector2(110,345)
	elif Globals.door_side == Globals.RIGHT:
		position = Vector2(1040,345)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(_delta):
	if Dialogic.current_timeline == null:
		get_input()
		move_and_slide()
	get_input()
