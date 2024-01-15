extends Node

@export var EnemyTemplate : PackedScene
@export var player_dist_threshold = 3

func _physics_process(delta):
	var player_position = $Player.position
	
	


func _on_spawn_time_timeout():
	var enemy = EnemyTemplate.instantiate()
	var groundSize = $Ground/MeshInstance3D.mesh.size
	enemy.position.x = (randf()*15) - 7.5
	enemy.position.z = (randf()*15) - 7.5
	
	add_child(enemy)
	
	enemy.caught.connect($UserInterface/ScoreLabel._on_mob_caught)
