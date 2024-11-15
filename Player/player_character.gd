extends CharacterBody2D

#var player_inputs = ["Up", "Left", "Down", "Right", "LeftClick"]
@export var speed = 300

var sword_scene = load("res://Player/Weapons/sword.tscn")
var sword_instance = sword_scene.instantiate()

var weapons = [sword_instance]
var current_weapon = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(sword_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_get_input()


func _get_input():
	#Movement script
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed
	move_and_slide()
	#if Input.is_action_just_pressed()
	var weapon_swap = Input.get_axis("WeaponSwapLeft", "WeaponSwapRight")
	current_weapon += weapon_swap
	print(current_weapon)
