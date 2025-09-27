extends StaticBody2D

var entered = 0
@export var timeline = ""

func _ready():
	$Area2D.body_entered.connect(_on_area_2d_body_entered)
	$Area2D.body_exited.connect(_on_area_2d_body_exited)
	print("Interactable ready")
	add_to_group("interactable")



func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		entered = 1
		emit_signal("player_entered", self)
		print("entered")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		entered = 0
		emit_signal("player_exited")
		print("exit")

func _process(_delta):
	if entered == 1 and Input.is_action_just_pressed("ui_accept"):
		if Dialogic.current_timeline == null:
			Dialogic.start(timeline)
