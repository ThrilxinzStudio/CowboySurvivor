extends CharacterBody2D

@onready var animation_player_upper = $AnimationPlayerUpper
@onready var animation_player_lower = $AnimationPlayerLower


func _physics_process(delta: float) -> void:
	var x_input = Input.get_axis("move_left", "move_right")
	var y_input = Input.get_axis("move_up", "move_down")
	
	velocity.x = x_input * 50
	velocity.y = y_input * 50
	
	if x_input == 0:
		animation_player_lower.play("stand")
		animation_player_upper.play("stand")
	else:
		animation_player_lower.play("run")
		animation_player_upper.play("run")
	
	move_and_slide()
