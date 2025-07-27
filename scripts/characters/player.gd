extends CharacterBody2D

@onready var animation_player_upper = $AnimationPlayerUpper
@onready var animation_player_lower = $AnimationPlayerLower
@onready var anchor = $Anchor

func _physics_process(delta: float) -> void:
	var x_input = Input.get_axis("move_left", "move_right")
	var y_input = Input.get_axis("move_up", "move_down")
	
	if not is_on_floor():
		velocity.y += 500 * delta
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -250
	
	velocity.x = x_input * 50 # movement
	
	if x_input == 0:
		animation_player_lower.play("stand")
		animation_player_upper.play("stand")
	else:
		anchor.scale.x = sign(x_input)
		animation_player_lower.play("run")
		animation_player_upper.play("run")
		
	if not is_on_floor():
		animation_player_lower.play("jump")
		animation_player_upper.play("jump")
	
	move_and_slide()
