class_name Hurtbox extends Area2D

var is_invisible: bool = false

signal hurt(other_hitbox: Hitbox)

func take_hit(other_hitbox: Hitbox) -> void:
	if is_invisible: return
	hurt.emit(other_hitbox)
	
