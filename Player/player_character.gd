extends CharacterBody2D

#var player_inputs = ["Up", "Left", "Down", "Right", "LeftClick"]
@export var speed = 300
@export var maxhealth := 200
@export var health = maxhealth


var sword_scene = load("res://Player/Weapons/sword.tscn")
var sword_instance = sword_scene.instantiate()
var hammer_scene = load("res://Player/Weapons/hammer.tscn")
var hammer_instance = hammer_scene.instantiate()

var can_swap := true

var weapons = [sword_scene, hammer_scene]
var current_weapon = 0

var equipped_weapon = weapons[current_weapon].instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(equipped_weapon)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_get_input()


func _get_input():
	#Movement script
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_just_pressed("WeaponSwapLeft") or Input.is_action_just_pressed("WeaponSwapRight"):
		_weapon_swap()


func _weapon_swap():
	if can_swap == false:
		return
	can_swap = false
	var weapon_swap = Input.get_axis("WeaponSwapLeft", "WeaponSwapRight")
	var new_weapon = current_weapon + weapon_swap
	if new_weapon < 0:
		new_weapon = weapons.size() - 1
	elif new_weapon > (weapons.size() - 1):
		new_weapon = 0
	equipped_weapon.queue_free()
	equipped_weapon = weapons[new_weapon].instantiate()
	add_child(equipped_weapon)
	current_weapon = new_weapon
	await get_tree().create_timer(0.5).timeout
	can_swap = true
