extends StaticBody2D

var ready_flag = 0
var entered = 0
@export var timeline = ""

func _on_ready() -> void:
	if ready_flag == 0:
		print("The baggage is ready")
		ready_flag = 1
		
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		entered = 1
		print("entered")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		entered = 0
		print("exit")

func _process(_delta):
	if entered == 1 and Input.is_action_just_pressed("ui_accept"):
		if Dialogic.current_timeline == null:
			Dialogic.start("timeline")
