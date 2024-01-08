extends Node

@export var player_dist_threshold = 3

func _physics_process(delta):
	var player_position = $Player.position
	
	
