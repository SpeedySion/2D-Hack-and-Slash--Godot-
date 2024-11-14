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
	health -= damage
	if health < 0:
		health = 0
		print("I am dead")
	print("I've taken damage")
	$AnimationPlayer.play("damaged")
