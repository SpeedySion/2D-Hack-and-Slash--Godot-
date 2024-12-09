class_name Spawner
extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.wait_time = 2.0
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	var spawnerentity = owner.spawnerentity.instantiate()
	var entity = spawnerentity
	get_parent().add_child(entity)
