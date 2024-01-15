extends CharacterBody3D

signal caught
@export var rotation_speed = 5
@export var min_speed = 0
@export var max_speed = 3

@export var player_position : Vector3

var random_position = Vector3(randf()*20, 1, randf()*20)
var time = 0

func _physics_process(delta):
	time+=delta
	#transform = transform.rotated_local(up_direction, rotation_speed*delta)
	#look_at(Vector3.UP.cross(position - Vector3(0,1,0)),Vector3.UP)
	if time > 2.5:
		time = 0
		random_position = Vector3(randf()*20 - 10, 1, randf()*20 - 10)
	
	if(transform.basis.z.angle_to(random_position)>0.2):
		transform = transform.rotated_local(up_direction, rotation_speed*delta)
		
	var random_speed = randf_range(min_speed, max_speed)
	velocity = -transform.basis.z * random_speed
	
	#velocity = velocity.rotated(Vector3.UP, rotation.y)
	move_and_slide()
	
#func initialize(start_position, player_position):
	#look_at_from_position(start_position, player_position, Vector3.UP)
	#rotate_y(randf_range(-PI/4, PI/4))
	#
	#var random_speed = randf_range(min_speed, max_speed)
	#velocity = Vector3.FORWARD * random_speed
	#
	#velocity = velocity.rotated(Vector3.UP, rotation.y)
	


func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
	
func catch():
	caught.emit()
	queue_free()
