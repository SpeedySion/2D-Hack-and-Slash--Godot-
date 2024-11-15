extends Node2D

@export var maxhealth := 100
@export var health = maxhealth
@export var speed := 200
var hitstunned := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not hitstunned:
		position = position.move_toward($"../../Player/PlayerCharacter".global_position, delta * speed)


func _take_damage(damage):
	hitstunned = true
	health -= damage
	if health <= 0:
		health = 0
		queue_free()
	$AnimationPlayer.play("Damaged")
	await $AnimationPlayer.animation_finished
	hitstunned = false
