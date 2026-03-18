extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_slide_collision(0) != null:
		end_game()		
	look_at(get_global_mouse_position())	
	if rotation_degrees < limit_left: 
		rotation_degrees = limit_left
	if rotation_degrees > limit_right: 
		rotation_degrees = limit_right
	velocity = transform.x * speed * delta * 60
	pass
const speed = 400
const angle_max = 60
const angle_UP = -90
const limit_right = angle_UP + angle_max
const limit_left = angle_UP - angle_max

func _physics_process(delta):
	move_and_slide()

func end_game(): #empty for now but the collision detect works
	1==1
