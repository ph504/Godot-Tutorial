extends CharacterBody3D

# variables
@export var speed = 14
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	# control section
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		
	if Input.is_action_pressed("move_back"):
		direction.z += 1
		
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		# face toward direction
		$Pivot.look_at(position + direction, Vector3.UP)
		
		
	target_velocity.x = direction.x*speed
	target_velocity.z = direction.z*speed
	
	# if in the air
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration*delta)
	
	velocity = target_velocity
	move_and_slide()
	_handle_collisions()
	
func _handle_collisions():
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
		if collision.get_collider() == null:
			continue
			
		if collision.get_collider().is_in_group("Enemy"):
			var enemy = collision.get_collider()
			enemy.catch()
			break
