extends Node

var current_car = ""
enum {MIDDLE, LEFT, RIGHT}
var door_side = MIDDLE

func change_car(next_car: String, car_side: int):
	current_car = next_car
	door_side = car_side
	get_tree().change_scene_to_file(next_car)

var eagle_dialog = 0.0
var lion_dialog = 0.0
var mole_dialog = 0.0
var alligator_dialog = 0.0
var penguin_dialog = 0.0
var goat_dialog = 0.0
var herring_dialog = 0.0
var bat_dialog = 0.0
var otter_dialog = 0.0
var cow_dialog = 0.0
var cat_dialog = 0.0
var rhino_dialog = 0.0
var dog_dialog = 0.0
var frog_dialog = 0.0
