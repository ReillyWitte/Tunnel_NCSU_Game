extends CharacterBody2D

@export var speed = 400

var dialogue_box: Label
var close_button: Button
var dialogue_lines: Array = ["Hello, detective!", "Welcome to our train."]

var current_line: int = 0
var line_timer: float = 0

func _ready():
	dialogue_box = Label.new()
	dialogue_box.visible = false
	add_child(dialogue_box)
	
	close_button = Button.new()
	close_button.text = "Close"
	close_button.position = Vector2(50, 30)
	close_button.visible = false
	close_button.pressed.connect(_on_close_button_pressed)
	add_child(close_button)
	
	if Globals.door_side == Globals.LEFT:
		position = Vector2(110,345)
	elif Globals.door_side == Globals.RIGHT:
		position = Vector2(1040,345)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	
	if line_timer > 0:
		line_timer -= delta
	elif current_line < dialogue_lines.size():
		show_next_dialogue_line()

func show_next_dialogue_line():
	dialogue_box.text = dialogue_lines[current_line]
	current_line += 1
   # Display each line for 3 seconds
	line_timer = 3.0

func _on_close_button_pressed():
	dialogue_box.visible = false
	close_button.visible = false
	current_line = 0
