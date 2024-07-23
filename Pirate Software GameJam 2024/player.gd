extends CharacterBody2D

@export var speed = 100
@export var friction = 0.1
@export var acceleration = 0.2
@export var roll_speed = 3000
@onready var _animated_sprite = $AnimatedSprite2D
var canRoll = true

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var vertical = Input.get_axis("move_up", "move_down")
	var horizontal = Input.get_axis("move_left", "move_right")
	var direction = Vector2(horizontal, vertical)
	
	#If left right or down is press and our and we werent already turned 
	if  Input.is_action_pressed("move_down") || Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right"):
		if Input.is_action_pressed("move_up"):
			_animated_sprite.play("walkup")
		else:
			_animated_sprite.play("walk")
	elif Input.is_action_pressed("move_up"):
		_animated_sprite.play("walkup")
	else:
		_animated_sprite.stop()
	#Handles Dash
	if Input.is_action_just_pressed("roll") && canRoll == true:
		canRoll = false
		velocity = velocity.lerp(direction.normalized() * roll_speed, acceleration)
		$DashTimer.start()
		
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	#When no input, slow down
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)

	move_and_slide()

func _on_dash_timer_timeout():
	canRoll = true
