extends Node2D

@export var maxhealth = 100
@export var health = maxhealth

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _take_damage(damage):
	#print(health , " - ", damage, " = ")
	health -= damage
	#print(health)
	if health <= 0:
		health = 0
		queue_free()
	$AnimationPlayer.play("Damaged")
