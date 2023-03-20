extends Hitbox

func _ready():
	connect("hit_something", self, "on_hit_something")

func on_hit_something(obj, hitbox):
	var mult = Utils.int_sign(get_parent().host.fighter_owner.opponent.get_pos().x - get_parent().host.fighter_owner.get_pos().x)
	get_parent().enter_force_dir_x = str(float(get_parent().enter_force_dir_x) * -mult)
	get_parent().apply_enter_force()
