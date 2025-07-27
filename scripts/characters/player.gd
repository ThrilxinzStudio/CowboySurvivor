extends CharacterBody2D


func _physics_process(delta: float) -> void:
	var x_input = Input.get_axis("move_left", "move_right")
	var y_input = Input.get_axis("move_up", "move_down")
	
	velocity.x = x_input * 50
	velocity.y = y_input * 50
	
	move_and_slide()
