extends StaticBody2D

var entered = 0

func _ready():
	$Area2D.body_entered.connect(_on_area_2d_body_entered)
	$Area2D.body_exited.connect(_on_area_2d_body_exited)
	print("Door ready")

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
