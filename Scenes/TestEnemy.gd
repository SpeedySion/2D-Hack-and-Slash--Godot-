extends Node2D

@export var maxhealth := 100
@export var health = maxhealth
@export var speed := 200
var hitstunned := false

signal TAKENDAMAGE(health)

# Called when the node enters the scene tree for the first time.
func _ready():
	#var player = get_node("res://Player/player_character.tscn")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not hitstunned:
		position = position.move_toward($"../../Player/PlayerCharacter".get_global_position(), delta * speed)


func _take_damage(damage):
	TAKENDAMAGE.emit(health)
	hitstunned = true
	health -= damage
	if health <= 0:
		health = 0
		queue_free()
	$AnimationPlayer.play("Damaged")
	await $AnimationPlayer.animation_finished
	hitstunned = false
