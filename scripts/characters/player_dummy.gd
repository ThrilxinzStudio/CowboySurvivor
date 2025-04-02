extends CharacterBody2D

@export var speed = 300.0
@export var bullet_speed = 1000.0
@export var fire_rate = 0.2

var bullet_scene = preload("res://scenes/ui/bullet.tscn")
var can_fire = true
var fire_timer = 0.0

func _process(delta: float) -> void:
	var direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up") 
	)
	 
	if direction.length() > 0:
		direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	#look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("shoot") and can_fire:
		shoot()
		can_fire = false
		fire_timer = fire_rate
		
	if not can_fire:
		fire_timer -= delta
		if fire_timer <= 0:
			can_fire = true
	
func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	bullet.rotation = rotation
	
	var bullet_velocity = Vector2(bullet_speed, 0).rotated(rotation)
	bullet.linear_velocity = bullet_velocity
	
	get_tree().current_scene.add_child(bullet)
	look_at(get_global_mouse_position())
