extends CharacterState

func _ready():
	pass

func _frame_44():
	host.gain_super_meter(host.MAX_SUPER_METER)
	host.unlock_achievement("ACH_HUSTLE", true)

const PROJECTILE_X = 37	
const PROJECTILE_Y = - 65

func _frame_25():
	var obj = host.spawn_object(preload("res://Pootis Mod/characters/Pootis/Projectiles/Sandwich.tscn"), PROJECTILE_X, PROJECTILE_Y, true, {"dir": fixed.normalized_vec("0", "0")})
