class_name HitBox
extends Area2D

@export var damage := 10

func _init():
	set_collision_layer(2)
	set_collision_mask(0)


