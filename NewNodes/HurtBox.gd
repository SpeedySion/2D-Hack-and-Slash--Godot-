class_name HurtBox
extends Area2D


func _init():
	set_collision_layer(0)
	set_collision_mask(2)


func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(hitbox):
	if hitbox is HitBox:
		if hitbox == null:
			return
		if owner.has_method("_take_damage") and hitbox.owner != self.owner:
			owner._take_damage(hitbox.damage)
