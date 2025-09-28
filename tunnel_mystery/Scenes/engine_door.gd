extends CollisionShape2D

func _process(delta):
	if Globals.mole_smoke == 1:
		shape = null
