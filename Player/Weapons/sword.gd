extends Node2D

@export var damage = 10
var damage_active = false
@export var active_frames = 2
var frames_remaining = active_frames
@export var attack_cooldown = 0.25
var available = true
@onready var timer = $Timer
var objects_in_hitbox = []

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(attack_cooldown)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotation = (get_global_mouse_position() - self.global_position).angle() + 0.5
	#print(self.rotation)
	if available:
		if Input.is_action_just_pressed("LeftClick"):
			available = false
			damage_active = true
			timer.start()
			print("Attack!")
	else:
		if frames_remaining > 0:
			frames_remaining -= 1
	if frames_remaining == 0:
		damage_active = false
		frames_remaining = active_frames
	if damage_active:
		print("Checking for targets")
		for entity in objects_in_hitbox:
			print(entity.has_method("take_damage"))
			if entity.has_method("take_damage"):
				print(entity)
				entity._take_damage(damage)


func _on_timer_timeout():
	available = true
	print("Attack off cooldown")


func _on_attack_area_body_entered(body):
	objects_in_hitbox.append(body)


func _on_attack_area_body_exited(body):
	var index = objects_in_hitbox.find(body)
	if index != -1:
		objects_in_hitbox.pop_at(index)


func _on_attack_area_area_entered(area):
	pass # Replace with function body.


func _on_attack_area_area_exited(area):
	pass # Replace with function body.
