extends Node2D

func _ready():
	if Globals.game_start == 0:
		Dialogic.start("the_agency_timeline")
		Globals.game_start = 1
