extends CharacterBody3D

signal caught
@export var rotation_speed = 1
@export var min_speed = 10
@export var max_speed = 18


func _physics_process(delta):
	#transform = transform.rotated_local(up_direction, rotation_speed*delta)
	#look_at(Vector3.UP.cross(position - Vector3(0,1,0)),Vector3.UP)
	#transform = transform.rotated(up_direction, rotation_speed*delta)
	
	move_and_slide()
	
func initialize(start_position, player_position):
	look_at_from_position(start_position, player_position, Vector3.UP)
	rotate_y(randf_range(-PI/4, PI/4))
	
	var random_speed = randf_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	
	velocity = velocity.rotated(Vector3.UP, rotation.y)
	


func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
	
func catch():
	caught.emit()
	queue_free()
