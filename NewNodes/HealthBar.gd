class_name HealthBar
extends ProgressBar


func _init():
	self.step = 1
	self.max_value = 100

func _ready():
	if owner == null:
		owner = get_parent()
	if owner.maxhealth != null and owner.health != null:
		self.value = owner.health / owner.maxhealth * 100
	if owner.has_method("_take_damage"):
		owner.TAKENDAMAGE.connect(_update_healthbar)

func _update_healthbar(newhealth):
	self.value = newhealth
