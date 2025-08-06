extends Node2D

@export var stats: Stats :
	set(value):
		stats = value
		if value is not Stats: return
		stats = stats.duplicate()

@onready var hurtbox = $Hurtbox

func _ready():
	hurtbox.hurt.connect(func(other_hitbox: Hitbox):
		stats.health -= other_hitbox.damage
		print(stats.health)
		)
	stats.no_health.connect(func():
		queue_free()
		)
