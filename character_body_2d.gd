extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())	
	if rotation_degrees < limit_left: 
		rotation_degrees = limit_left
	if rotation_degrees > limit_right: 
		rotation_degrees = limit_right
	velocity = transform.x * speed
	pass
@export var speed = 400
@export var angle_max = 60
@export var angle_UP = -90
@export var limit_right = angle_UP + angle_max
@export var limit_left = angle_UP - angle_max

func _physics_process(delta):
	move_and_slide()
