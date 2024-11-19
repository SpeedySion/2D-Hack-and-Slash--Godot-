class_name WallToggleZone
extends Area2D

#wether the wall starts as enabled or not
@export var start_state = false


func _init():
	self.set_deferred("disabled", start_state)
	set_collision_layer(0)
	set_collision_mask(1)

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_area_entered)
	self.set_deferred("disabled", start_state)


func _on_area_entered(node):
	if node is CharacterBody2D:
		$CollisionShape2D.disabled = !$CollisionShape2D.disabled
		print("Wall Toggled")
