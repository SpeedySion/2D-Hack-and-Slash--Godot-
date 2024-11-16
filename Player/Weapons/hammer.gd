extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotation = (get_global_mouse_position() - self.global_position).angle() + 0.5
	if Input.is_action_pressed("LeftClick"):
		$AnimationPlayer.play("Attack")
