extends Node

var current_car = ""
enum {MIDDLE, LEFT, RIGHT}
var door_side = MIDDLE

func change_car(next_car: String, car_side: int):
	current_car = next_car
	door_side = car_side
	get_tree().change_scene_to_file(next_car)
