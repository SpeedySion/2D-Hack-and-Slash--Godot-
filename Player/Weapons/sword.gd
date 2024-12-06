extends Node2D

var attackallow = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotation = (get_global_mouse_position() - self.global_position).angle() + 0.5
	if Input.is_action_pressed("LeftClick") and attackallow == true:
		attackallow = false
		$AnimationPlayer.play("Attack")
		await $AnimationPlayer.animation_finished
		attackallow = true
