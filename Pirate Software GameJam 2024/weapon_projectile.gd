extends Area2D

var speed = 50.0
var direction : Vector2
var friction = .1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta
