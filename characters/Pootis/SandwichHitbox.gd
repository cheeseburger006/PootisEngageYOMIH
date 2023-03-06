extends Hitbox

func _ready():
	connect("hit_something", self, "on_hit_something")

func on_hit_something(obj, hitbox):
	get_parent().enter_force_dir_x = str(float(get_parent().enter_force_dir_x) * -1);
	get_parent().apply_enter_force()
