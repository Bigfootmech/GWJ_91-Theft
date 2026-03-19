extends CharacterBody2D

const speed = 4000
const angle_max = 60
const angle_UP = -90
const limit_right = angle_UP + angle_max
const limit_left = angle_UP - angle_max
var gameOver = false
var roadIteration = 1
var roadNodePath = ^"../../Highway/Background1"
var cameraY = 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation = 0
	cameraY = $PlayerCamera.get_target_position().y - 650
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (cameraY - $PlayerCamera.get_target_position().y) > 650:
		iterate_road()
	if gameOver == true:
		return
	if get_slide_collision(0) != null:
		end_game()
			
	look_at(get_global_mouse_position())	
	if rotation_degrees < limit_left: 
		rotation_degrees = limit_left
	if rotation_degrees > limit_right: 
		rotation_degrees = limit_right
	velocity = transform.x * speed * delta * 60
	pass

func _physics_process(delta):
	move_and_slide()
	pass

func end_game():
	self.get_node(^"../../Wrecked").position = self.position
	gameOver = true
	pass

func iterate_road():
	cameraY -= 650
	self.get_node(roadNodePath).offset.y -= 3250
	roadIteration += 1
	if roadIteration == 6:
		roadIteration = 1
	roadNodePath = NodePath("../../Highway/Background" + str(roadIteration))
