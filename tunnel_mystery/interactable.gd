# interactable.gd
class_name Interactable extends Area2D # Or Area3D for 3D games

signal interacted(interactor)

func _ready():
	# Connect signals for detecting player entry/exit
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.has_method("can_interact"): # Check if the body is a player/interactor
		# Optionally, show an interaction prompt
		pass

func _on_body_exited(body):
	if body.has_method("can_interact"):
		# Optionally, hide the interaction prompt
		pass

func interact(interactor):
	# This method will be overridden by specific interactable objects
	push_warning("Interactable object needs to override the interact() method.")
	emit_signal("interacted", interactor)
