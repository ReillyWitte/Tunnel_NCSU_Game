extends PathFollow2D

var entered = 0
var timeline = "mole_timeline"
@export var idle_animation = ""
@export var moving_animation = ""

var speed: float = 40
var direction := 1  # 1 = forward, -1 = backward

func _ready():
	$StaticBody2D/Area2D.body_entered.connect(_on_area_2d_body_entered)
	$StaticBody2D/Area2D.body_exited.connect(_on_area_2d_body_exited)
	print("Interactable ready")
	add_to_group("interactable")

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		entered = 1
		print("entered")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		entered = 0
		print("exit")
   
func _process(delta):	
	if entered == 1 and Input.is_action_just_pressed("ui_accept"):
		if Dialogic.current_timeline == null:
			Dialogic.start(timeline)
		
	if Globals.mole_smoke == 1:
		Globals.mole_dialog = 1
		progress += direction * speed
		if progress_ratio >= .01:
			Globals.mole_smoke = 2
	if Globals.mole_smoke == 2:
		visible = 0
		Globals.mole_dialog = 2
		
