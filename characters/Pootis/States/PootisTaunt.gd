extends CharacterState

func _ready():
	pass

const PROJECTILE_X = 37	
const PROJECTILE_Y = - 65

func _frame_25():
	var obj = host.spawn_object(preload("res://Pootis Mod/characters/Pootis/Projectiles/Sandwich.tscn"), PROJECTILE_X, PROJECTILE_Y, true, {"dir": fixed.normalized_vec("0", "0")})
