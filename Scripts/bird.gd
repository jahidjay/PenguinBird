extends CharacterBody2D


class_name Bird
@export var gravity = 900.0
@export var jump_force = -300
@export var rotation_speed = 2

@onready var animation_player = $AnimationPlayer

var max_speed = 400
var is_started = false 
var should_process_input = true

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _ready():
	velocity = Vector2.ZERO
	animation_player.play("Idle")
	
	
func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		if !is_started:
			animation_player.play("flap_wings")
			is_started = true 
		jump()
		
	if !is_started:
		return
		velocity.y += gravity * delta
		velocity.y = min(velocity.y, max_speed)
		
		move_and_collide(velocity * delta)
		
		rotate_Bird()
		

		
func jump():
	velocity.y = jump_force 
	rotation = deg_to_rad(-30)
	
	
func rotate_Bird():
	if velocity.y > 0 && rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)
		
	elif velocity.y < 0 && rad_to_deg(rotation) > -30:
		rotation -= rotation_speed * deg_to_rad(1)
		
func stop():
	animation_player.stop()
	gravity = 0
	velocity = Vector2.ZERO
	should_process_input = false




