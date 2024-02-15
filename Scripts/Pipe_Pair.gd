extends Node2D


class_name PipePair

signal bird_entered
signal point_scored
signal bird_crashed

var speed = 0

func set_speed(new_speed):
	speed = new_speed
	
func _process(delta):
	position.x += speed * delta
	print(position.x)

func _on_body_entered(body):
	bird_crashed.emit()
	(body as BirdCharacter).stop()
	
func _on_point_scored(body):
	point_scored.emit()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

