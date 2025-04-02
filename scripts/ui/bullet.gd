extends Area2D

var linear_velocity = Vector2.ZERO
var lifetime = 2.0

func _ready():

	var timer = Timer.new()
	timer.wait_time = lifetime
	timer.one_shot = true
	timer.autostart = true
	timer.timeout.connect(_on_lifetime_timeout)
	add_child(timer)

func _physics_process(delta):
	position += linear_velocity * delta

func _on_lifetime_timeout():
	queue_free()

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body.take_damage(1)  # implement this function in the enemy script
		queue_free()
