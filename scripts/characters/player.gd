extends CharacterBody2D

@export var speed = 300.0

func _physics_process(delta: float) -> void:
	var direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up") 
	)
	
	if direction.length() > 0:
		direction = direction.normalized()
		
	velocity = direction * speed
	move_and_slide()
	# player rotation pointing to mouse
	look_at(get_global_mouse_position())
