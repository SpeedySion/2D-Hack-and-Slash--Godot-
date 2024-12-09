extends Node2D

@export var maxhealth := 100
@export var health = maxhealth
@export var speed := 150
var hitstunned := false

signal TAKENDAMAGE(health)

var playerpath : Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	playerpath = get_node("/root/TestScene/Player/PlayerCharacter") 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not hitstunned:
		position = position.move_toward(playerpath.get_global_position(), delta * speed)
		#$"../../Player/PlayerCharacter"

func _take_damage(damage):
	hitstunned = true
	health -= damage
	if health <= 0:
		health = 0
		queue_free()
	TAKENDAMAGE.emit(health)
	$AnimationPlayer.play("Damaged")
	await $AnimationPlayer.animation_finished
	hitstunned = false
