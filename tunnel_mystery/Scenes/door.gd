# Door.gd - Attach this script to the root "Door" Node.
extends StaticBody2D

var entered = 0

@export var next_car: String
@export var next_side: int
@onready var doorAudio = $doorSound


func _ready():
	$InteractZone.body_entered.connect(_on_interact_zone_body_entered)
	$InteractZone.body_exited.connect(_on_interact_zone_body_exited)
	print("Door ready")
	
func _on_interact_zone_body_entered(body):
	if body.is_in_group("player"):
		entered = 1
		
		print("entered")

func _on_interact_zone_body_exited(body):
	doorAudio.play()
	entered = 0
	print("exit")
	
func _process(_delta):
	if entered == 1 and Input.is_action_just_pressed("ui_accept"):
		Globals.change_car(next_car, next_side)
