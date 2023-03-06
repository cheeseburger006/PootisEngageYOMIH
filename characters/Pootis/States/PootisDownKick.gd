extends CharacterState

func _ready():
	get_child(0).connect("hit_something", self, "on_hit_something")

func on_hit_something(obj, hitbox):
	var force = xy_to_dir("-1.0", "-1.0", "6.0", "1.0")
	host.apply_force_relative(force.x, force.y)
