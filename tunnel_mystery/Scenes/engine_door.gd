extends CollisionShape2D

var entered = 0

func _process(delta):
	if Globals.mole_smoke == 1:
		shape = null

func _ready():
	print("Door ready")
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		entered = 1
		if shape != null:
			Globals.mole_dialog = 3.0
			Dialogic.start("mole_timeline")
		print("entered")
		



func _on_area_2d_body_exited(body: Node2D) -> void:
	entered = 0
	print("exit")
