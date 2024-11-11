extends CharacterBody2D

#var player_inputs = ["Up", "Left", "Down", "Right", "LeftClick"]
@export var speed = 300
var player_state

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_get_input()


func _get_input():
	#Movement script
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed
	move_and_slide()
	#Sets movement state
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state ="walking"
