extends Label

var score = 0
@export var winScreen : AcceptDialog


func _on_mob_caught():
	score += 1
	text = "Score: %s" % score
