extends Node2D

@export var texture: Texture2D
@export var tile_size: Vector2 = Vector2(64, 64)
@export var grid_size: Vector2i = Vector2i(10, 10)

func _ready():
	for x in range(grid_size.x):
		for y in range(grid_size.y):
			var sprite = Sprite2D.new()
			sprite.texture = texture
			sprite.position = Vector2(x, y) * tile_size
			add_child(sprite)
